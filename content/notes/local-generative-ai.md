---
title: "A Report on Using Local Generative AI"
date: 2026-06-08
draft: false
description: "My first week running a coding model on my own laptop, prompted by PewDiePie's Odysseus workspace: what worked, what didn't, and why the harness matters more than the model."
aliases:
  - /posts/ia-generativa-local/
---

## The Launch of Odysseus and a First Contact

On May 31, 2026, the world got a clear look at one of the main benefits of generative AI for code. That day, one of the best-known voices on YouTube clicked "Upload" and offered a glimpse of the answer. PewDiePie published a video about his tool Odysseus, which is essentially a local workspace for AI agents. That week, it was all anyone talked about, so I decided to try it. There was one catch that made it unusual compared with how I normally use coding agents: the workspace was designed for local models, something I had never used for any length of time. So I had my first real experience. I went to huggingface.com, downloaded a model (qwen2.5-coder-3b-instruct) that seemed compatible with my GPU (an RTX 3050 mobile in my laptop), and set out to sea.

## Model Performance and First Impressions

The experience was intriguing, to say the least. As expected, the model was considerably slower than models like Gemini, Claude, or Codex, and the quality of its answers came nowhere near any of them. But being able to run it locally, without an internet connection, felt surreal at the time.

## Difficulties and Limits as an Agent

I had trouble using it as an agent and for reading documents. Often it simply didn't work, and when it did, it was slow.

## Workspace Features and Data Privacy

By far, the integrated tools in the workspace were the best part. Persistent memory, with models and agents able to evolve as you interact with them and "save" information, without worrying about a company harvesting your data, is remarkable. There are also many tools for connecting the agents to email, notes, tasks, reminders, calendars, and more.

## Easy Setup and Felix Kjellberg's Cookbook

That's not all. The tool's creator, Felix Kjellberg, went to the trouble of writing a "cookbook" so the tool can scan the user's hardware, recommend models, download them, and get them running, all in an extremely accessible way.

## The Impact of the Harness and What Comes Next

In short, the harness built around these models is genuinely surprising, and it deserves study for future agents shipped by companies like Anthropic, Google, and OpenAI.

## Conclusion: Democratizing the Creation of Projects

One of the main benefits of generative AI is that it lets ideas and projects come to life. People who already knew how to program, and people who never studied programming, can now take their project sketches off paper and build them in a reasonably accessible way, just as Felix did.
