---
title: Better code rewrites that scale through ast-grep
---

<img width="3228" height="1051" alt="image" src="https://github.com/user-attachments/assets/5a9f3423-56aa-4f2a-96bb-532cc42f74f5" />

# Better code rewrites that scale through ast-grep
2025-7-10

https://github.com/ast-grep/ast-grep

People who have worked with know I'm a fan of the terminal, abstraction and refactoring, ast-grep has been such a great addition to my toolbelt.

Long time ago when I was updating my editor configuration file for Vim I came across an issue in correctness and performance in syntax coloring whenever certain lines would go over the limit in some programming languages. It came down to how Vim would understand language formatting, it would primarily be done with Regex, where certain language features or quirks would fall through the cracks of the syntax process.

I searched for how this could be improved, that was when I first encountered the term Abstract Syntax Trees. By utilizing this structure, the editor had a more precise representation of how the code is interpreted and some times even better performance.

Long time after, I was attempting to have automatic linter fixes applied to a JavaScript codebase, unfortunately the tool did not have the capability to auto fix, only to warn about the outdated syntax.

My first reaction was, global search/replace a naive solution because I was running into whitespace and other valid but exceptional way of writing code.

I started to wonder; How can this process be correct and handle all the different forms this piece of code was written.

I got to know about codemods and how through the power of AST's, it could allow an understanding of the context around what's being replaced. 

In JavaScript, the answer was Jscodeshift. But I began to feel like this only applied to a narrow subset of the different languages I might want to support.

Enter ast-grep, written in Rust it is able to run without a Run time. Faster execution because it is compiled and finally seems to be actively maintained.

Ripgrep is great but it is mostly a tool for searching inside files, not replacing. Sd, another tool inspired by sed can be used for simple pattern replacements.

The tool has been a breath of fresh air for migrations and finding patterns not quite achievable through Regex expressions can achive.

Hope you find this tool useful and if you have any cool things you've done with it please share.


