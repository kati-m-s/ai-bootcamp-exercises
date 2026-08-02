# Solution Notes

## Environment
- Python version: I used Colab because that's what we have used in university so it was the path of least resistance. Also I didn't have my computer with me, using either library computer or one borrowed from a relative.
- Key libraries used:
- LLM API used: -
- LLM model used: -

## Highest Level Completed

_Mark which level you reached per exercise:_

| Exercise | BASE | STANDARD | ADVANCED |
|----------|------|----------|----------|
| 1 - Python & Data | [ X] | [X ] | [ ] |
| 2 - SQL | [ X] | [X ] | [ X] |
| 3 - LLM | [ ] | [ ] | [ ] |
| 4 - Integration | [ ] | [ ] | [ ] |

---

## Exercise 1: Data Handling

**Your approach:** _Describe what you did and why._

**If you completed BASE:** What was your strategy for handling the messy priority values (mixed case like "HIGH", "high", "High")? Did you use any specific Python technique?

**If you completed STANDARD:** What would you change if this dataset had 1 million rows instead of 35?

**If you completed ADVANCED:** How did you decide what counts as an "anomaly"? Where do you draw the line between messy data and actually wrong data?

---

## Exercise 2: SQL

**Your approach:** _Describe what you did and why._

I used regular SQL, with some help from googling, especially for SQLite specialties and date functions.

**If you completed BASE:** Which query was hardest to write and what did you look up or try before getting it right?

I looked up the kinds of JOIN because back when I learnt SQL, we did it with WHERE clause but I remembered that it is not considered best practice.

**If you completed STANDARD:** In Query 6 (active projects per department), how did you handle departments with zero projects? What happens if you use INNER JOIN instead?

I used LEFT JOIN. INNER JOIN would lose these departments that have no department id among projects.

**If you completed ADVANCED:** Query 9 (highest salary per department with ties) — what approach did you take, and what's an alternative way to solve it?

I used PARTITION BY department, RANK them within that department by salary, then show people with rank 1. 
An alternative way would be to use MAX function for each department and then show people in each department whose salary is equal to that max salary.

---

## Exercise 3: LLM & Prompt Engineering

**Your approach:** _Describe what you did and why._
Did nothing. No existing LLM accounts, not enough computer time and resources.

**If you completed BASE:** What did you notice about how the LLM responds differently when you change the wording of your prompt? Give a specific example.

**If you completed STANDARD:** Which of your two prompt strategies worked better? Paste both prompts here and explain what specifically made the difference.

**If you completed ADVANCED:** How does your retry logic decide when to give up? What's the worst-case scenario for your error handling?

---

## Exercise 4: Integration

**Your approach:** _Describe what you did and why._
Did nothing. No existing LLM accounts, not enough computer time and resources.

**If you completed BASE:** How did you handle stop-word removal in keyword extraction? What list did you use and would you change it?

**If you completed STANDARD:** If one document fails during LLM processing, does your pipeline stop or continue? Paste the specific code that handles this.

**If you completed ADVANCED:** How does your incremental processing detect which documents were already processed? What happens if the output file gets corrupted?

---

## Process Questions

_These questions are about your experience doing the task, not the code itself._

1. **What did you get stuck on longest?** Describe the specific moment — what you were trying to do, what went wrong, and how you got past it.

To use Python in github when I had only a tablet for that. Then I gave up and went with Colab.

2. **What did you Google/search for during this task?** List 2–3 specific things you looked up.

"SQLite TOP 3"
"date format in SQLite"
"python pandas help"

4. **If you used AI tools (Copilot, ChatGPT, etc.), which parts did you use them for?** Be honest — this is not penalized. We want to understand your workflow.

Gemini insisted in helping me in Colab with Python exercises, sometimes I took what it suggested because I would have probably ended up in the same with regular documentation (I struggle with syntax because I have used several different of programming languages over years, each with a slightly different syntax), but I always paused to think if I believe its suggestions. Sometimes I didn't, and used regular documentation or suggestions from stackexchange etc.
Not with SQL though because that I wrote in a regular Notepad and uploaded to Colab for the script to use.

---

## Self-Estimation

_Rate your current skill level honestly (1 = no experience, 5 = very confident):_

| Skill | 1 | 2 | 3 | 4 | 5 |
|-------|---|---|---|---|---|
| Python programming | [] | [ x] | [ ] | [ ] | [ ] |
| Working with data (files, CSV, JSON) | [ ] | [ ] | [x] | [ ] | [ ] |
| pandas / data analysis | [ ] | [x] | [ ] | [ ] | [ ] |
| SQL | [ ] | [ ] | [ ] | [X ] | [ ] |
| Git and version control | [ ] | [ ] | [ x] | [ ] | [ ] |
| REST APIs (calling/building) | [x ] | [] | [ ] | [ ] | [ ] |
| LLMs and prompt engineering | [ ] | [x ] | [ ] | [ ] | [ ] |
| Error handling and debugging | [ ] | [x ] | [ ] | [ ] | [ ] |
| Reading documentation to learn new tools | [ ] | [ ] | [ ] | [x ] | [ ] |
| Explaining technical concepts to others | [ ] | [ ] | [ ] | [x] | [ ] |

Can't say I haven't done at all, but...

**What is your strongest technical skill overall?**

Logical thinking (SQL is all that).
And I guess what with having taught how to solve logical puzzles to students for over a decade, I should be pretty good at explaining concepts to others.

**What is the area you most want to improve during the bootcamp?**

I didn't even know there was going to be a bootcamp??

**Have you built any personal or work projects before? If yes, briefly describe one:**



## Self-Assessment

_What are you least confident about in your submission? What would you do differently next time?_

LLMs.
And I would take my computer (with exercises and examples from studies) with me to vacation!
