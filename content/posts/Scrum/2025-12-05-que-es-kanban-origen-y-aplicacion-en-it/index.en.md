---
title: "What is Kanban: origin, purpose and its application in IT"
slug: "scrum/what-is-kanban-origin-and-application-in-it"
date: 2025-12-05T00:00:00.000Z
draft: false
hideLastModified: false
summary: "Discover what Kanban is, its origin in the Japanese manufacturing industry, how it has been adapted to software development, and a critical reflection on its application in the IT sector."
categories: [scrum]
tags: [kanban, agile, methodologies, lean, project-management]
---

In the world of software development and project management, Kanban has become a widely adopted methodology. However, few know its fascinating origin and the reasons why it was created. In this article, we will explore what Kanban is, where it comes from, why it was born, and reflect on whether its extrapolation to the IT sector really makes sense.

## What is Kanban?

Kanban is a visual work management system that seeks to optimize task flow and improve process efficiency. The term comes from Japanese and literally means "visual card" or "signal" (看板). At its core, Kanban is based on visualizing work, limiting work in progress (WIP), and maximizing flow efficiency.

The system uses a visual board where tasks are represented as cards that move through different columns representing process states, typically: "To Do", "In Progress", and "Done". This simplicity is deceptive, as behind it lie profound principles of process optimization.

## Origin: The Toyota Factory

The history of Kanban begins in Japan, in the 1940s, in Toyota factories. At that time, the Japanese manufacturing industry faced serious challenges. After World War II, Japan had limited resources and needed to compete with the mass production of American factories, especially with the Fordist model that dominated the automotive industry.

Taiichi Ohno, Toyota's industrial engineer, observed that the mass production model generated enormous waste: large batches of parts were manufactured and stored until needed, taking up space, immobilizing capital, and often becoming obsolete before being used.

Inspired by American supermarkets—where products were replenished only when consumed—Ohno designed a "pull" production system instead of "push". In this system, each workstation only produced what was necessary when the next station requested it, using physical cards (kanban) as signals to indicate the need for more materials or components.

## Why was Kanban created? The original intention

Kanban was created with several specific intentions within the Toyota context:

### 1. Eliminate waste (Muda)

The main objective was to eliminate seven types of waste identified in production: overproduction, waiting time, unnecessary transport, excessive processing, unnecessary inventory, unnecessary movement, and defects. By producing only what was necessary at the exact moment, these wastes were minimized.

### 2. Implement Just-In-Time (JIT) production

Kanban was the tool that made the Just-In-Time concept possible: produce what is needed, when it is needed, in the exact quantity needed. This reduced storage costs and improved production flexibility.

### 3. Improve quality

By limiting work in progress, quality problems were detected more quickly. If there was a defect, it affected fewer parts and could be corrected immediately, rather than being discovered at the end when hundreds of defective units had already been produced.

### 4. Empower workers

The Kanban system gave autonomy to workers at each station to stop the production line if they detected problems, fostering responsibility and continuous improvement (Kaizen).

## Extrapolation to the IT sector

In the early 2000s, David J. Anderson began adapting Kanban principles to software development. The first documented implementation was at Microsoft in 2004. Anderson recognized that, although software development is very different from manufacturing, it shared similar problems:

- **Excessive work in progress**: teams working on too many tasks simultaneously, without finishing any
- **Bottlenecks**: some phases of the process slower than others
- **Lack of visibility**: difficulty knowing what each person was doing and what the real status of the project was
- **Constant priority changes**: frequent interruptions that prevented completing work

The IT adaptation maintained the fundamental principles:

### Kanban Principles in IT

1. **Visualize work**: use boards (physical or digital) to see all tasks
2. **Limit WIP**: establish maximum limits of tasks in each phase
3. **Manage flow**: optimize the movement of tasks through the system
4. **Make policies explicit**: clearly define when a task moves from one state to another
5. **Implement feedback loops**: regular meetings to review and improve
6. **Improve collaboratively, evolve experimentally**: use data to improve the process incrementally

### Differences from the original implementation

Unlike physical manufacturing, in IT:
- "Inventory" is knowledge, code, and requirements, not physical parts
- "Defects" are bugs or misinterpreted requirements
- "Flow" is the movement of tasks from conception to delivering value to the user
- Variability is much greater: each development task is potentially unique

## Critical reflection: Does Kanban make sense in IT?

This is perhaps the most interesting and controversial question. My reflection, after having worked with Kanban in several teams, is nuanced:

### Positive aspects of Kanban in IT

**1. Visualization is invaluable**

In a world of intangible work like software development, making work visible is genuinely useful. Seeing all tasks on a board helps identify problems that would otherwise remain hidden: work accumulation in certain phases, forgotten tasks, blocking dependencies.

**2. Limiting WIP improves focus**

The natural tendency in IT is multitasking. Limiting work in progress forces teams to finish what they start before starting something new, which generally results in higher productivity and less context switching.

**3. Data-driven continuous improvement**

Kanban promotes the use of metrics such as Lead Time (time from when a task is initiated until completed) and Cycle Time (time the task is actively being worked on). These metrics allow objective improvement.

**4. Adaptive flexibility**

Unlike more prescriptive methodologies like Scrum, Kanban allows changes to be incorporated at any time, which is valuable in contexts of high uncertainty or software maintenance.

### Limitations and misunderstandings

**1. It's not just a board**

The biggest mistake is thinking that Kanban is simply having a board with columns. Many teams "do Kanban" by moving post-its but without implementing the real principles: no WIP limits, no flow measurement, no explicit policies. This is "visual board", not Kanban.

**2. The nature of the work is different**

Software development has intrinsic variability far superior to manufacturing. A card that says "Implement login" can take 2 hours or 2 weeks depending on factors unknown at the start. In manufacturing, producing a part has a predictable duration. This fundamental difference makes some Kanban principles less applicable.

**3. Intellectual work is not an assembly line**

Software development requires creativity, complex problem solving, and intense collaboration. Optimizing "flow" as if it were a production chain can lead to a reductionist mindset that ignores the cognitive nature of the work.

**4. Risk of micromanagement**

A very detailed board with many columns and rules can become a micromanagement tool that stifles team autonomy instead of promoting it.

**5. The illusion of predictability**

Although Kanban promises greater predictability through flow metrics, in practice, the inherent variability of software development means these predictions have considerable margins of error. Relying too much on these metrics can generate false expectations.

### So, does it make sense?

My answer is: **it depends on the context**.

Kanban makes sense in IT when:
- The team does maintenance or support work with continuous task flow
- There is high variability in priorities and flexibility is needed
- The team is mature and self-disciplined to apply the principles correctly
- It is used as a continuous improvement tool, not as a control method

Kanban does NOT make as much sense when:
- It is applied superficially, only as a "pretty board"
- The team needs more structure and cadence (Scrum sprints may be better)
- It is used to micromanage or pressure the team
- The collaborative and intellectual nature of software development is ignored

## Conclusion: Beyond methodological dogma

Kanban, like any methodology, is a tool. Its value lies in the underlying principles: visualization, work in progress limitation, flow optimization, and continuous improvement. These principles are valuable in any context.

However, the mechanical extrapolation of a system designed for physical manufacturing to software development has its limits. The real value of Kanban in IT is not in religiously following its rules, but in adopting its philosophy of transparency, conscious limitation, and evidence-based improvement.

What matters is understanding the *why* behind the *how*. Kanban was born to solve specific problems in a specific context. In IT, we must intelligently adapt these principles to our context, without losing sight that we are working with creative people solving complex problems, not with mechanical parts on an assembly line.

The question should not be "should we use Kanban?", but "what problems are we trying to solve and can Kanban help us solve them?". Only from that pragmatic perspective, free from dogmas, can we extract the true value of this methodology.

As Taiichi Ohno, the original creator of the system, said: "There is nothing particularly difficult about the Toyota Production System. The difficulty is in making it work." The same applies to Kanban in IT: the theory is simple, effective practice requires deep understanding, discipline, and constant adaptation.
