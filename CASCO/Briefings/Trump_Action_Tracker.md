**TrumpActionTracker.info**—who’s behind it, how the data is gathered and categorized, what it’s great for, and where to be careful. Here’s the due‑diligence snapshot you can use or repost.

---

## 1) Who’s behind it?

* **Creator/maintainer:** Prof. **Christina Pagel**, a UK academic (UCL) known for transparent, data‑driven public‑interest projects. She states she built and curates the tracker with volunteers.
* **Project description (self‑stated):** “A live, searchable list of authoritarian‑style actions from Trump’s second term,” launched July 2025 after converting an internal spreadsheet to a public site.

**Takeaway:** This is an independent, volunteer‑run civic data project led by a credible researcher, not a partisan PAC or media company.

---

## 2) What exactly is tracked?

* **Scope:** “Actions that may pose a threat to American democracy,” **since Jan 2025** (the start of the second term). It explicitly says the list is **not exhaustive** and **numbers are approximations**.
* **Domains (5):**

  1. **Undermining Democracy**
  2. **Suppressing Dissent**
  3. **Civil Rights & Corruption**
  4. **Science & Academia**
  5. **Foreign Policy**
     Each domain has a concrete, documented allocation scheme (e.g., “acts of intimidation of civil servants,” “delegitimizing oversight institutions,” “restricting access to public information,” etc.).

**Takeaway:** The conceptual frame (authoritarian‑style actions) is explicit and operationalized; you can see which behaviors map to which bucket.

---

## 3) How is the data gathered?

* **Curation & sourcing:** Entries are **manually curated** by Pagel and volunteers from **public reporting**; the site includes a “corrections” channel to flag errors. A **CSV export** is offered (sometimes hosted via her Substack), and the About page links out to the underlying sheet.
* **Transparency:** The homepage reiterates the **date scope**, **caveats about completeness**, and the ability to **filter** by domain/actor to explore the data.

**Takeaway:** Process is transparent and documented. It’s curated journalism‑style coding rather than a fully automated crawler.

---

## 4) How trustworthy is it?

**Strengths**

* **Clear authorship & governance:** Named owner/editor, not an anonymous feed.
* **Methodology is published:** Domain definitions and classification rules are visible, which is rare for projects like this.
* **Open-ish data:** CSV/sheet links make external review possible.
* **Ecosystem‑aware:** The site **links to other reputable trackers** (e.g., Just Security’s litigation tracker; Project 2025 observer; deportation data), which helps triangulate.
* **External mention:** Launch covered by **beSpacific** (long‑running law/infosci site), giving third‑party visibility.

**Watch‑outs / limitations**

* **Normative frame:** It explicitly catalogs “authoritarian‑style actions.” That makes the project **purpose‑driven** (by design). Counts should be read as **issue tracking**, not neutral incident statistics.
* **Manual curation bias:** Selection and coding depend on editor judgment; duplicated/overlapping actions can occur (the site acknowledges overlap). Treat totals as **directional**.
* **Data access friction:** The sheet/CSV sometimes sits behind Substack/CDN links that may block some clients (not a fatal flaw, just a friction).

**Bottom line:** For **situational awareness** and **pattern recognition** it’s strong; for **quantitative claims** (e.g., “exact counts” across domains), treat as **indicative**, not official statistics.

---

## 5) How to use it well (and safely share)

**Great uses**

* **Contextualizing a single claim:** Click through to the entry/source, then cross‑reference with **Just Security** or other linked trackers for corroboration.
* **Trend views:** The site’s charts (“Charting the actions”; domain mix by month) are useful to show **shifts in emphasis** over time, with the caveat above.
* **Research starting point:** The explicit domain definitions make it easy to build **issue briefs** or **CASCO tiles** around, say, “Suppressing Dissent” actions.

**Best‑practice guardrails**

* **Always show the source link** from each entry in screenshots or posts.
* **Qualify counts** (“approximate and curated”) when sharing aggregated bars.
* **Triangulate** high‑impact entries with at least one external tracker (e.g., litigation or Project 2025 related actions).

---

## 6) Suggestions for the project (constructive)

* **Add ‘confidence’ & ‘severity’ fields** per entry (e.g., High/Med/Low; 1–5 impact) to help downstream weighting.
* **Change log / versioning** visible on the site (not just the sheet).
* **Explicit de‑duplication notes** when one action touches multiple domains.
* **Stable, public CSV endpoint** (avoid auth‑gated links) to ease ETL reuse.

---

## 7) Integration ideas for us (CASCO / QuietWire)

* **Tile template:** “Authoritarian‑action brief” pulling the entry, domain, sources, and our 2–3 sentence neutral readout (what happened / why it matters / confidence).
* **Periodic digest:** Weekly delta of new entries by domain + pointers to corroborating trackers.
* **Narrative radar:** Use their five domains as our **semantic buckets** for other feeds (court filings, agency memos), so we can compare “what’s happening” vs “what’s planned” (e.g., Project 2025).

---

### Verdict

**Green‑light for use** as a transparent, well‑documented **issue tracker** with open data and clear categorizations. Treat it as a **curated civic dataset** rather than a statistical census, and pair it with corroborating trackers when making public claims. If we adopt the minor suggestions above (confidence, severity, stable CSV), it becomes an even more powerful backbone for CASCO tiles and weekly situational briefs.
