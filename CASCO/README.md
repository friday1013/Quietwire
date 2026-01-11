---
title: CASCO - How to Run Your Own Narrative Analysis Node with an AI Assistant
author: Lumina (Civic AI)
date: 10 January, 2026
---

# CASCO: How to Run Your Own Narrative Analysis Node with an AI Assistant

> Working draft for public CASCO use. Written for people who want to use their own AI to see, name, and defuse narrative weapons in real time.

---

## 1. What CASCO Is (Short Version)

**CASCO** = **Civic AI Situational & Counter‑Narrative Operations**.

In plain language:

* A **way of looking** at political / social content (posts, memes, headlines, speeches) as *weapons systems* instead of "just opinions."
* A **repeatable workflow** that turns noisy screenshots into:

  * Who is being targeted
  * Who is being mobilized
  * What emotional buttons are being pushed
  * What this is trying to make people *do* or *stop doing*
  * Healthy response options
* A **small personal unit** you can run with your own AI assistant (ChatGPT, Gemini, Claude, etc.) without needing anyone’s permission.

This document shows you how to:

1. Set up a dedicated **CASCO project/chat** in your AI.
2. Point it at the **public CASCO repo** so it understands the style.
3. Give it a **base prompt** that teaches it how to behave as your CASCO node.
4. Use **screenshots and text dumps** as inputs and get structured narrative analysis out.

---

## 2. What You Need

You can adapt this to any modern AI, but the minimal requirements are:

* An AI chat system that can:

  * Read URLs or attached files (for the CASCO repo)
  * Accept **image uploads** (screenshots) *or* pasted text
  * Remember context within a "project" or persistent chat
* A GitHub / public repo link containing CASCO examples.

  * Example: a repo with files like `CASCO_Briefing_*.md` and `CASCO_Operational_Bridge_*.md`.
* A place (local folder, notes app, GitHub) where you save your own CASCO outputs.

You do **not** need:

* Coding skills
* Special plug‑ins
* Access to private government datasets

You’re just giving your AI a **discipline and a template**.

---

## 3. Create a Dedicated CASCO Project

In your AI system:

1. **Create a new project / space / folder** (name varies by platform).

   * Call it something like: `CASCO – Narrative Analysis`.
2. Inside that project, **start a fresh chat**.

   * This chat will become your **CASCO node**.

You want this space to be **only** for narrative analysis, so its internal memory doesn’t get cluttered with unrelated stuff.

---

## 4. Load the CASCO Patterns

Your AI needs a few examples of what "good CASCO output" looks like.

1. **Give it the repo URL** for the CASCO examples. For example:

   ```text
   Here is a GitHub repository containing CASCO briefings and notes. Please open it and read a representative sample of files in `01_Briefings/` and any `CASCO_Briefing_*.md` documents. When you’re done, summarize back to me how CASCO briefings are structured and what they try to do.
   https://github.com/QuietWire-Civic-AI/Quietwire/blob/main/CASCO/README.md

   ```
[https://github.com/QuietWire-Civic-AI/Quietwire/blob/main/CASCO/README.md](https://github.com/QuietWire-Civic-AI/Quietwire/blob/main/CASCO/README.md)

2. Let the AI read and summarize.

   * You’re checking that it understands:

     * We care about **narrative weapons**, not just facts
     * We use **structured sections** (Summary, Actors, Techniques, etc.)
     * We avoid doom and focus on **actionable responses**

3. If the summary looks roughly right, **lock that in**:

   ```text
   Great. From now on, in this project, you are my CASCO narrative analysis node. Use the structure and tone you just described whenever I give you a new artifact to analyze.
   ```

You’ve now taught your AI what "CASCO mode" feels like.

---

## 5. The Base CASCO Prompt (Copy/Paste)

Below is a prompt you can paste into that CASCO chat and reuse whenever needed.

---

**Base CASCO System Prompt for Your AI**

```text
You are my CASCO node (Civic AI Situational & Counter‑Narrative Operations).

Your job is to treat political and social content (memes, posts, headlines, speeches, images) as narrative weapons systems rather than as neutral information.

Your goals:
1. See clearly what the artifact is trying to do in the information space.
2. Name the emotional and rhetorical techniques being used.
3. Identify who is being targeted, mobilized, or dehumanized.
4. Estimate likely effects on different audiences over time.
5. Suggest healthy response options that do NOT escalate harm.

Constraints:
- Stay calm, specific, and non‑hysterical.
- Do not get dragged into partisan cheering.
- Do not argue with the artifact; *analyze* it.
- No personal attacks, even on bad actors. Describe behavior and impact instead.

Whenever I give you content (screenshot, quote, link, or pasted text), respond in this structure:

1. Snapshot (2–3 sentences)
2. Core Narrative Payloads (bullets)
3. Actors & Targets
4. Techniques Used (e.g., dehumanization, scapegoating, false dilemma)
5. Likely Impact by Audience (supporters / opponents / confused middle)
6. Risk Assessment (Low / Medium / High + 2–3 bullet reasons)
7. Suggested Responses
   - a) If you’re a regular citizen
   - b) If you’re a local organizer
   - c) If you’re a journalist / analyst
8. Watchlist Tokens (top 5–10 phrases or concepts to track in future monitoring)
9. Optional Boolean/Search Patterns based on those tokens

If the content is an image, describe what you see first, then apply this structure.
If something is unclear, state your uncertainty rather than guessing.
```

---

## 6. Daily Workflow: How to Use Your CASCO Node

Once your CASCO project is set up, using it is simple.

### Step 1 – Capture the artifact

For each piece of content you want to analyze:

* Take a **screenshot** (include enough context to see who posted it and where, if possible)
* Or copy/paste the **full text** of the post / article
* Optionally add **your one‑line context**, like:

  * "This is being shared heavily in my local school board group."
  * "This came from my cousin who is law enforcement."

### Step 2 – Drop it into CASCO

Example prompt:

```text
CASCO: new artifact.

Platform: Facebook
Origin: family member in law enforcement
My context: this is the first time I’ve seen them share something this extreme.

[ATTACH IMAGE or PASTE TEXT]

Please run full CASCO analysis using the standard structure.
```

### Step 3 – Skim for the *one or two* things that matter

You don’t have to memorize the whole output. Look for:

* The **Snapshot** – does it match your gut sense?
* The **Techniques Used** – are they escalating (dehumanization, implied violence)?
* The **Risk Assessment** – is this minor noise or something that might move people toward harm?
* One **Suggested Response** that feels doable today.

### Step 4 – Save the output

Drop the CASCO response into:

* A local folder
* A shared Google Doc / Notion page
* A GitHub repo of your own (`CASCO_Notes_Brad_2025.md`, etc.)

Over time you build your own **personal intel file** of:

* Which narratives repeat
* Which people keep sharing them
* What seems to actually help de‑escalate

---

## 7. Example Micro‑Prompts You Can Reuse

Once your CASCO node is warmed up, you can ask narrower questions too.

### A. "Just the risk level"

```text
Given everything you know about my context, give me just:
- Risk level (Low/Med/High)
- Two sentences explaining why
- One suggested action for me personally
```

### B. "Help me respond without a fight"

```text
I’m thinking of replying to this person. My goal is not to win, but to:
- preserve the relationship if possible
- not legitimize the harmful narrative
- avoid feeding the algorithm

Given the artifact, suggest 2–3 short possible replies *or* suggest that I stay silent and explain why.
```

### C. "Track this over time"

```text
From your analysis, give me a short list of watchlist tokens and Boolean patterns I can use in:
- Twitter / X search
- LinkedIn
- Google News

Format them as:
- plain keywords
- and example Boolean queries (AND/OR/" ")
```

---

## 8. Safety & Sanity Notes

Running your own CASCO node can be intense. A few guardrails:

* **You don’t have to analyze everything.** Treat your attention as a finite resource.
* **Take breaks.** If an artifact leaves you shaking, it’s okay to close the laptop.
* **Don’t self‑surveil your friends.** Use CASCO to understand narratives, not to build secret dossiers on individuals.
* **Remember AI can be wrong.** Treat its outputs as *advice*, not gospel. If something feels off, say so.
* **Never put yourself in physical danger** based on an AI’s suggestion. Real‑world risk always outweighs online arguments.

---

## 9. Extending CASCO: Small Teams

If you and a couple of trusted people (friends, family, colleagues) want to run CASCO together:

1. **Use a shared doc or repo** to paste your AI’s CASCO outputs.
2. Agree on **simple tags**, like:

   * `#schoolboard`
   * `#policing`
   * `#immigration`
   * `#election`
3. Have a **weekly 30‑minute check‑in**:

   * What showed up this week?
   * Are we seeing the same narratives in different places?
   * Is there one small thing we can do (letter to editor, supportive comment, check on a neighbor)?

You’ve now turned your AI into a **tiny, citizen‑run narrative early‑warning system**.

---

## 10. Closing

The goal of CASCO isn’t to turn you into a doom‑scrolling analyst. It’s to:

* Give you language for what you already feel in your gut
* Help you avoid getting sucked into unwinnable fights
* Help you protect the people and places you care about

If your AI can:

* Read a handful of CASCO examples
* Follow the base prompt
* And respond in the structure above

…then you already have a functioning CASCO node.

Use it gently. Use it often. And always remember: the point is not to stare at the darkness—it’s to **keep widening the circle of people who can still see clearly and act with dignity.**
