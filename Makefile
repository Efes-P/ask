
.PHONY: all clean

all: action.plan.md

quality.md: codebase.txt
	@echo "Running Code Quality Analysis..."
	@cat codebase.txt | ask "Analyze the following code for quality, focusing on readability, structure, and code duplication. Provide exactly 5 to 7 bullet points in the format 'problem -> fix'." > quality.md

perf.md: codebase.txt
	@echo "Running Performance Analysis..."
	@cat codebase.txt | ask "Analyze the following code for performance bottlenecks and inefficiencies. Provide exactly 5 to 7 bullet points in the format 'issue -> optimization'." > perf.md

security.md: codebase.txt
	@echo "Running Security Analysis..."
	@cat codebase.txt | ask "Analyze the following code for security vulnerabilities and unsafe patterns. Provide exactly 5 to 7 bullet points in the format 'risk -> mitigation'." > security.md

quality.sum.md: quality.md
	@echo "Summarizing Code Quality Report..."
	@cat quality.md | ask "Compress the following quality analysis into exactly 5 bullet points. Keep only the most critical, actionable items." > quality.sum.md

perf.sum.md: perf.md
	@echo "Summarizing Performance Report..."
	@cat perf.md | ask "Compress the following performance analysis into exactly 5 bullet points. Keep only the most critical, actionable items." > perf.sum.md

security.sum.md: security.md
	@echo "Summarizing Security Report..."
	@cat security.md | ask "Compress the following security analysis into exactly 5 bullet points. Keep only the most critical, actionable items." > security.sum.md

concatenated.md: quality.sum.md perf.sum.md security.sum.md
	@echo "Concatenating summaries into a single report..."
	@echo "## Code Quality" > concatenated.md
	@cat quality.sum.md >> concatenated.md
	@echo "" >> concatenated.md
	@echo "## Performance" >> concatenated.md
	@cat perf.sum.md >> concatenated.md
	@echo "" >> concatenated.md
	@echo "## Security" >> concatenated.md
	@cat security.sum.md >> concatenated.md

refined.md: concatenated.md
	@echo "Refining concatenated report (removing duplicates, filtering high-signal issues)..."
	@cat concatenated.md | ask "Review this concatenated report containing Code Quality, Performance, and Security sections. Remove any duplicate findings and keep only high-signal, critical issues. Maintain the same three section headings." > refined.md

action.plan.md: refined.md
	@echo "Generating final Engineering Action Plan..."
	@cat refined.md | ask "Based on the refined analysis, generate a final 'Engineering Action Plan'. Organize the plan as a prioritized list categorized by priority: High / Medium / Low. For each action item, provide an effort estimate (Small / Medium / Large) and a logical execution order." > action.plan.md

clean:
	@echo "Cleaning up generated pipeline files..."
	rm -f quality.md perf.md security.md
	rm -f quality.sum.md perf.sum.md security.sum.md
	rm -f concatenated.md refined.md action.plan.md
