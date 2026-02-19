# Writing That Gets Things Done

## Introduction

You’re trying to make a decision: ship vs. delay, build vs. buy, change architecture vs. patch it, accept risk vs. mitigate it. The most reliable way to surface assumptions, expose gaps, and align on a decision is a document that makes the problem legible, the tradeoffs explicit, and the next step unambiguous. In async-heavy teams, writing is the decision interface. Some companies (Amazon is the obvious example) institutionalized this: narratives over slides, clarity over performative alignment. You can borrow the mechanics without borrowing the culture. This post is a practical framework and checklist you can apply to your next design doc, solution proposal, incident write-up, or business memo.

## Writing Is Thinking

Writing forces you to structure and stress-test your ideas before sharing them. A verbal explanation lets you skip over gaps — you can gesture, pivot, or rely on your audience to fill in the blanks. A written document cannot hide those gaps. Bezos put it plainly: there is no way to write a six-page narratively structured memo and not have clear thinking. Drafting even a one-page brief surfaces flawed assumptions, missing data, and logical non-sequiturs that a slide deck can hide.

A well-written document replaces a meeting, reduces back-and-forth, and creates a lasting reference. Slides push information at people; documents invite scrutiny. Amazon runs silent reading sessions before discussion begins — because readers who reach page 1 with a question often find it answered by page 2\. That discipline scales: the same document reviewed by five people across five time zones needs no meeting at all.

## Before You Write: Three Questions

Every document should answer three questions before the first sentence is written. First: why are you writing? What specific decision or action does this document drive? If you cannot name it, you are not ready to write. Second: who is your audience? An engineer, a non-technical PM, and a VP each require different depth, vocabulary, and emphasis — calibrate accordingly. Third: why should they read it? Your reader is busy and expert. Write for value given, not information dumped. If your document does not make their next decision faster or smarter, cut until it does.

## Be Direct: Short Sentences, Actual Numbers

Keep sentences under 30 words. Aim for 20 or fewer. Each sentence carries exactly one message. When you find yourself writing a sentence with two independent clauses joined by "and" or "but," split it. Long sentences hide weak reasoning behind syntactic complexity.

Replace adjectives with data. Vague qualifiers give readers nothing to act on. Precise numbers give them everything they need.

Apply the "so what" test to every sentence: if it does not drive a decision or surface an insight, cut it. For direct questions, give one of four answers — yes, no, a number, or "I don't know, and will follow up by \[date\]."

**Good vs bad examples:**



| Subject | ❌ Bad writing | ✅ Good writing |
| ----- | ----- | ----- |
| Performance claims | "The new model is much faster" | "Inference latency dropped from 340ms to 40ms (88% reduction) after deploying the quantized model on Feb 14, 2026" |
| Scale and impact | "Most users were affected" | "73% of active users (12,400 accounts) experienced degraded response times between 14:00 and 16:30 UTC on Feb 12, 2026" |
| Effort and timelines | "This will take a while to implement" | "Full implementation requires 6 weeks: 2 weeks for backend refactor, 3 weeks for QA, 1 week for staged rollout" |
| Cost and resources | "Cloud costs have gone up" | "AWS spend increased 34% month-over-month, from $42K in Dec 2025 to $56K in Jan 2026, driven by untagged EC2 instances in us-east-1" |

## Write for Time: Absolute References Only

Documents outlive their context. Relative time references decay the moment a document is saved. A new team member, a cross-functional partner, or a future reader should understand your document without a decoder ring. Never assume shared context — spell out every acronym and unit on first use.

| Subject | ❌ Bad writing | ✅ Good writing |
| ----- | ----- | ----- |
| Time references | "We deployed the fix last week" | "We deployed the fix on Feb 12, 2026" |
|  | "The issue started recently" | "The issue started on Jan 28, 2026 at 14:23 UTC" |
| | |
| Acronyms and units | "p99 latency exceeded SLA thresholds" | "99th-percentile (p99) latency exceeded the 200ms service level agreement (SLA) threshold" |
| | "Cost increased by 2.4M" | "Cost increased by $2.4M (USD), from $7.1M in Q3 2025 to $9.5M in Q4 2025" |
| | |
| Shared context | "As discussed in the last meeting" | "As agreed in the architecture review on Feb 10, 2026" |
| | "Per the previous proposal" | "Per the cost optimization proposal submitted on Jan 15, 2026" |
| | |

## **Writing Style Checklist**

Most documents fail the same way: vague claims that hide behind adjectives, passive sentences that obscure ownership, and logic that jumps between unrelated topics. This checklist eliminates those failure modes before they reach your reader.

**Eliminate vague language:** No weasel words — might, could, some argue, often, significantly. No peacock words — cutting-edge, innovative, best-in-class, state-of-the-art. Every claim backed by data or a cited source.

**Tighten the writing:** Each sentence under 30 words, one message each. Active voice throughout. Acronyms defined on first use. No relative time references.

**Check the logic:** Each paragraph makes one argument. Paragraphs flow — topic sentence, evidence, link to next. The document answers a clear question or drives a specific decision. If you cannot state that question in one sentence, revise until you can.

| Rubric | ❌ Bad writing | ✅ Good writing |
| ----- | ----- | ----- |
| ☑ No weasel words — qualifiers that hedge claims without adding information | "This approach might improve performance" | "This approach reduced p99 latency by 40ms in staging tests on Feb 10, 2026" |
|  | "Some teams have reported issues" | "3 of 12 teams reported authentication failures after the Feb 14, 2026 deployment" |
|  | "This could significantly impact revenue" | "Based on Feb 2026 traffic, a 200ms latency increase would affect 8,400 checkout sessions per day, risking $62K in daily revenue" |
| | |
| ☑ No peacock words — claims of superiority with no supporting data | "We built a cutting-edge, best-in-class ML pipeline" | "Our ML pipeline processes 1.2M events per second with p99 latency under 18ms, as measured on Feb 15, 2026" |
|  | "This is an innovative solution to the problem" | "This solution eliminates the manual reconciliation step, reducing processing time from 4 hours to 11 minutes" |
|  | "We leverage state-of-the-art infrastructure" | "We run on GKE with autoscaling across 3 regions, handling up to 40K requests per second" |
| | |
| ☑ Every claim backed by data or a cited source | "Users prefer the new interface" | "In the Feb 2026 usability study (n=120), 78% of users completed the checkout flow without assistance, up from 51% in Jan 2026" |
|  | "The competitor's product is slower" | "In our Feb 12, 2026 benchmark, our API returned results in 42ms vs. 310ms for Competitor X under identical load conditions" |
| | |
| ☑ Each sentence under 30 words, one message each | "The system was experiencing elevated error rates which caused the on-call engineer to be paged and subsequently the incident response process was initiated at 02:14 UTC" | "Error rates exceeded 5% at 02:11 UTC on Feb 16, 2026\. The on-call engineer was paged at 02:14 UTC. Incident response started immediately." |
| | |
| ☑ Active voice throughout | "The deployment was rolled back by the platform team" | "The platform team rolled back the deployment at 03:42 UTC on Feb 16, 2026" |
|  | "A decision was made to proceed with Option B" | "The architecture review panel decided on Feb 10, 2026 to proceed with Option B" |
| | |
| ☑ No relative time references | "We recently completed the migration and will finalize the cleanup soon" | "We completed the migration on Feb 9, 2026\. Cleanup is scheduled for Feb 28, 2026" |
|☑ Each paragraph makes one argument | "Caching reduced latency. We also need to hire two engineers. The database is running out of disk space." | Three separate paragraphs, each covering one topic with supporting evidence and a clear next step |
| | |
|☑ The document answers a clear question or drives a specific decision| A document titled "Q1 Infrastructure Update" covering 12 unrelated topics with no recommended action | A document titled "Decision Required: Migrate Search to Elasticsearch by Mar 31, 2026 — Cost, Risk, and Recommended Path" |
| | "This document covers various aspects of our current architecture and some thoughts on potential future directions" | "This document recommends migrating to microservices by Q3 2026 and requests approval to staff a 4-person migration team starting Mar 1, 2026" |

## Document Formats That Work

For most situations, a one-pager is the right tool: one problem, one proposed solution, key supporting data, one clear next step with an owner. Use appendices for tables, graphs, or raw data — keep the main narrative clean and scannable. Reserve longer formats (three to six pages) for high-stakes decisions: architecture changes, research proposals, incident post-mortems, or investment cases.

When the decision is complex enough to warrant a longer document, use a fixed structure — introduction, goals, tenets, state of the business, lessons learned, and strategic priorities. A predictable format lets readers engage with ideas rather than decode structure. One final discipline: omit the author's name. Let the idea stand on its own merits.

For a reusable template, see Appendix B: Minimal Decision Document.

## Conclusion

Clear writing is a force multiplier for any technical team. It replaces meetings, accelerates decisions, and scales institutional knowledge across time zones and org changes. You do not need a company-wide mandate to start. Apply this framework to your next design doc, incident report, or proposal email.

Most alignment problems are undocumented decisions. Fix the writing, and the alignment follows.

## Appendix A: Known weasel words

**Hedging qualifiers** might, may, could, would, should, can, possibly, perhaps, probably, potentially, presumably, apparently, seemingly, ostensibly

**Vague frequency** often, frequently, sometimes, occasionally, generally, usually, typically, commonly, regularly, largely, mostly, broadly, in many cases, in some cases

**Vague quantity** some, many, few, several, various, numerous, certain, a number of, a variety of, a range of, most, majority, minority

**Vague magnitude** significant, substantial, considerable, notable, major, minor, marginal, meaningful, material, meaningful, moderate, extensive, limited

**Vague improvement** better, worse, faster, slower, cheaper, more expensive, higher, lower, increased, decreased, improved, degraded — (any comparative without a reference point or number)

**Epistemic hedges** it is believed, it is thought, it is felt, it seems, it appears, evidence suggests, data indicates, research shows — (without a cited source)

**Attribution deflection** some argue, some say, many believe, experts suggest, industry thinks, people feel, stakeholders expect, the team feels

**Vague time** recently, soon, shortly, in the near future, going forward, eventually, in due course, at some point, historically, traditionally, in the past

**Filler intensifiers** very, quite, rather, fairly, pretty, somewhat, relatively, extremely, incredibly, highly, deeply, truly, really, essentially, basically, virtually, effectively, largely

## Appendix B: Minimal Decision Document

Most decisions fail not in execution but in documentation — the reasoning is never written down, options are never compared, and six months later nobody remembers why the call was made. A decision document does not need to be long. It needs to be complete.

**Decision required:** One sentence stating exactly what needs to be approved or chosen, and by when. *"Approve migration from self-hosted Elasticsearch to Elastic Cloud by Mar 31, 2026."*

**Context:** What changed that makes this decision necessary now. Two to three sentences maximum. *"Elasticsearch 7.x reaches end-of-life on Aug 31, 2026\. Our current cluster requires a $40K hardware refresh to remain on-prem. Elastic Cloud eliminates that capital expenditure."*

**Options considered:** List every option evaluated, including the status quo.

| Option | Cost | Risk | Notes |
| :---- | :---- | :---- | :---- |
| Migrate to Elastic Cloud | $18K/yr | Low | Managed, no hardware refresh needed |
| Refresh on-prem hardware | $40K upfront | Medium | Extends runway 3 years, still on us to maintain |
| Stay on current hardware | $0 now | High | EOL Aug 2026, no security patches after that |

**Data and tradeoffs:** The two or three numbers that actually drive the decision. *"Elastic Cloud costs $18K/year vs. $40K upfront for hardware refresh. Migration requires 3 weeks of engineering time. Downtime risk: under 4 hours with blue-green cutover."*

**Recommendation:** One sentence, no hedging. *"Migrate to Elastic Cloud. Lower total cost, eliminates operational burden, and meets the Aug 2026 EOL deadline with margin."*

**Owner and date:** Who is accountable, and when the decision expires. *"Owner: Platform Engineering Lead. Decision required by Mar 1, 2026."*

## 

## References

* [https://managebetter.com/blog/writing-at-amazon](https://managebetter.com/blog/writing-at-amazon)  
* [https://medium.com/@raphael.moutard/writing-the-amazon-way-1f853cbe6937](https://medium.com/@raphael.moutard/writing-the-amazon-way-1f853cbe6937)  
* [https://www.focal.vc/founder-resources/https-buildsmarter-substack-com-p-write-like-an-amazonian](https://www.focal.vc/founder-resources/https-buildsmarter-substack-com-p-write-like-an-amazonian)  
* [https://www.firstprinciples.ventures/insights/four-tips-to-write-like-amazon](https://www.firstprinciples.ventures/insights/four-tips-to-write-like-amazon)  
* [https://www.theprfaq.com/articles/amazon-writing-culture](https://www.theprfaq.com/articles/amazon-writing-culture)  
* [https://www.armandpatella.com/amazon-writing-tips](https://www.armandpatella.com/amazon-writing-tips)  
* [https://quartr.com/insights/business-philosophy/amazon-s-writing-culture-explained](https://quartr.com/insights/business-philosophy/amazon-s-writing-culture-explained)  
* [https://medium.com/@apappascs/write-like-an-amazonian-14-tips-for-clear-and-persuasive-communication-e2a11afc7362](https://medium.com/@apappascs/write-like-an-amazonian-14-tips-for-clear-and-persuasive-communication-e2a11afc7362)
