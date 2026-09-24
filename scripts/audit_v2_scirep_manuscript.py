from pathlib import Path
import re

MANUSCRIPT = Path("manuscript/RPL_decidua_scientific_reports_manuscript_v2.md")
OUT = Path("manuscript/qc/RPL_decidua_v2_local_submission_audit_20260924.txt")

text = MANUSCRIPT.read_text(encoding="utf-8", errors="replace")

def heading_pattern(title):
    return rf"(?im)^\s*#*\s*{re.escape(title)}\s*$"

def has_heading(title):
    return re.search(heading_pattern(title), text) is not None

def section_between(start, stops):
    s = re.search(heading_pattern(start), text)
    if not s:
        return ""
    start_i = s.end()
    stop_i = len(text)
    for stop in stops:
        m = re.search(heading_pattern(stop), text[start_i:])
        if m:
            stop_i = min(stop_i, start_i + m.start())
    return text[start_i:stop_i]

def parse_citation_numbers(token):
    nums = set()
    token = token.replace("–", "-").replace("\\u2013", "-")
    for part in re.split(r"[;,]", token):
        part = part.strip()
        if not part:
            continue
        if "-" in part:
            a, b = [x.strip() for x in part.split("-", 1)]
            if a.isdigit() and b.isdigit():
                nums.update(range(int(a), int(b) + 1))
        elif part.isdigit():
            nums.add(int(part))
    return nums

required_sections = [
    "Abstract",
    "Introduction",
    "Materials and Methods",
    "Results",
    "Discussion",
    "Conclusion",
    "Data Availability Statement",
    "Author contributions",
    "Funding",
    "Acknowledgments",
    "Competing interests",
    "References",
    "Supporting information captions",
    "Figure legends",
    "Tables",
]

missing_sections = [sec for sec in required_sections if not has_heading(sec)]

refs_section = section_between("References", ["Supporting information captions", "Figure legends", "Tables"])
ref_entries = re.findall(r"(?m)^\s*(\d+)\.\s+(.+)", refs_section)
ref_numbers = [int(n) for n, _ in ref_entries]

main_text_before_refs = re.split(heading_pattern("References"), text, maxsplit=1)[0]
citation_tokens = re.findall(r"\[([0-9][0-9,\-\u2013; ]*)\]", main_text_before_refs)
cited_numbers = set()
for tok in citation_tokens:
    cited_numbers.update(parse_citation_numbers(tok))

uncited_refs = sorted(set(ref_numbers) - cited_numbers)
cited_not_listed = sorted(cited_numbers - set(ref_numbers))

fig_in_text = sorted(set(re.findall(r"\b(?:Fig\.|Figure)\s+([0-9]+)", main_text_before_refs)))
fig_legends = sorted(set(re.findall(r"(?m)^\s*(?:\*\*)?Figure\s+([0-9]+)\.", text)))

table_in_text = sorted(set(re.findall(r"\bTable\s+([0-9]+)", main_text_before_refs)))
table_headings = sorted(set(re.findall(r"(?m)^\s*Table\s+([0-9]+)\.", text)))

supp_fig_in_text = sorted(set(re.findall(r"\bSupplementary\s+Fig(?:ure)?\.?\s+S?([0-9]+)", main_text_before_refs, flags=re.I)))
supp_fig_legends = sorted(set(re.findall(r"(?m)^\s*(?:\*\*)?Supplementary\s+Fig(?:ure)?\.?\s+S?([0-9]+)\.", text, flags=re.I)))

supp_table_in_text = sorted(set(re.findall(r"\bSupplementary\s+Table\s+S?([0-9]+)", main_text_before_refs, flags=re.I)))
supp_table_captions = sorted(set(re.findall(r"(?m)^\s*Supplementary\s+Table\s+S?([0-9]+)\.", text, flags=re.I)))

bad_tokens = [
    "[REF:",
    "reference pending",
    "TODO",
    "TBD",
    "Citation map:",
    "Manuscript status:",
    "git add",
    "git commit",
    "git push",
    "cat >",
]

bad_found = [tok for tok in bad_tokens if tok in text]

doi_refs = [n for n, body in ref_entries if re.search(r"\bdoi:|https?://", body, flags=re.I)]
refs_without_doi_or_url = [
    (n, body[:140]) for n, body in ref_entries
    if not re.search(r"\bdoi:|https?://", body, flags=re.I)
]

report = []
report.append("RPL decidua v2 local submission audit")
report.append(f"Input manuscript: {MANUSCRIPT}")
report.append("")
report.append("Section structure")
report.append(f"Required sections checked: {len(required_sections)}")
report.append(f"Missing sections: {missing_sections if missing_sections else 'None'}")
report.append("")
report.append("Reference audit")
report.append(f"Reference entries listed: {len(ref_entries)}")
if ref_numbers:
    expected = list(range(1, max(ref_numbers) + 1))
    missing_ref_numbers = sorted(set(expected) - set(ref_numbers))
    report.append(f"Reference number range: {min(ref_numbers)}-{max(ref_numbers)}")
    report.append(f"Missing reference numbers in list: {missing_ref_numbers if missing_ref_numbers else 'None'}")
else:
    report.append("Reference number range: NA")
    report.append("Missing reference numbers in list: NA")
report.append("Target reference range: 30-40")
report.append(f"Cited reference numbers in main text: {len(cited_numbers)}")
report.append(f"Uncited listed references: {uncited_refs if uncited_refs else 'None'}")
report.append(f"Cited numbers not listed: {cited_not_listed if cited_not_listed else 'None'}")
report.append(f"References with DOI or URL detected: {len(doi_refs)}")
report.append(f"References without DOI or URL detected: {len(refs_without_doi_or_url)}")
if refs_without_doi_or_url:
    report.append("References without DOI/URL, first 25:")
    for n, body in refs_without_doi_or_url[:25]:
        report.append(f"  {n}. {body}")
report.append("")
report.append("Figure/table citation audit")
report.append(f"Figures cited in text: {fig_in_text if fig_in_text else 'None'}")
report.append(f"Figure legends present: {fig_legends if fig_legends else 'None'}")
report.append(f"Figure legends missing in text citations: {sorted(set(fig_legends)-set(fig_in_text)) if fig_legends else 'NA'}")
report.append(f"Figure citations missing legends: {sorted(set(fig_in_text)-set(fig_legends)) if fig_in_text else 'NA'}")
report.append(f"Tables cited in text: {table_in_text if table_in_text else 'None'}")
report.append(f"Table headings present: {table_headings if table_headings else 'None'}")
report.append(f"Table headings missing in text citations: {sorted(set(table_headings)-set(table_in_text)) if table_headings else 'NA'}")
report.append(f"Table citations missing headings: {sorted(set(table_in_text)-set(table_headings)) if table_in_text else 'NA'}")
report.append("")
report.append("Supplementary-material audit")
report.append(f"Supplementary figures cited in text: {supp_fig_in_text if supp_fig_in_text else 'None'}")
report.append(f"Supplementary figure legends present: {supp_fig_legends if supp_fig_legends else 'None'}")
report.append(f"Supplementary figure legends missing in text citations: {sorted(set(supp_fig_legends)-set(supp_fig_in_text)) if supp_fig_legends else 'NA'}")
report.append(f"Supplementary figure citations missing legends: {sorted(set(supp_fig_in_text)-set(supp_fig_legends)) if supp_fig_in_text else 'NA'}")
report.append(f"Supplementary tables cited in text: {supp_table_in_text if supp_table_in_text else 'None'}")
report.append(f"Supplementary table captions present: {supp_table_captions if supp_table_captions else 'None'}")
report.append(f"Supplementary table captions missing in text citations: {sorted(set(supp_table_captions)-set(supp_table_in_text)) if supp_table_captions else 'NA'}")
report.append(f"Supplementary table citations missing captions: {sorted(set(supp_table_in_text)-set(supp_table_captions)) if supp_table_in_text else 'NA'}")
report.append("")
report.append("Internal-placeholder audit")
report.append(f"Problem tokens found: {bad_found if bad_found else 'None'}")
report.append("")
report.append("Preliminary interpretation")
if len(ref_entries) < 30:
    report.append("- Reference count is below target and needs expansion.")
elif len(ref_entries) > 40:
    report.append("- Reference count is above target and may need trimming.")
else:
    report.append("- Reference count is within target range.")
if uncited_refs:
    report.append("- Some listed references are not cited in the main text; check whether they should be cited or removed.")
if cited_not_listed:
    report.append("- Some in-text citations point to missing reference-list numbers; fix before submission.")
if refs_without_doi_or_url:
    report.append("- Some references lack DOI/URL metadata and should be polished before final submission.")
if not bad_found:
    report.append("- No obvious internal placeholders or shell-command artifacts detected.")
if missing_sections:
    report.append("- Missing required sections should be restored before v2.1.")
else:
    report.append("- Required Scientific Reports-style sections are present.")

OUT.parent.mkdir(parents=True, exist_ok=True)
OUT.write_text("\n".join(report) + "\n", encoding="utf-8")
print(OUT)
