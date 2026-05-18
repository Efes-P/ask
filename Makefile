.PHONY: all clean

	@echo "Running Code Quality Analysis..."
	@cat codebase.txt | ask "Analyze the following code for quality, focusing on readability, structure, and code duplication. Provide exactly 5 to 7 bullet points in the format 'problem -> fix'." 

	@echo "Running Performance Analysis..."
	@cat codebase.txt | ask "Analyze the following code for performance bottlenecks and inefficiencies. Provide exactly 5 to 7 bullet points in the format 'issue -> optimization'." 

	@echo "Running Security Analysis..."
	@cat codebase.txt | ask "Analyze the following code for security vulnerabilities and unsafe patterns. Provide exactly 5 to 7 bullet points in the format 'risk -> mitigation'." 

	@echo "Summarizing Code Quality Report..."
	@cat quality.md | ask "Compress the following quality analysis into exactly 5 bullet points. Keep only the most critical, actionable items." 

	@echo "Summarizing Performance Report..."
	@cat perf.md | ask "Compress the following performance analysis into exactly 5 bullet points. Keep only the most critical, actionable items."

	@echo "Summarizing Security Report..."
	@cat security.md | ask "Compress the following security analysis into exactly 5 bullet points. Keep only the most critical, actionable items."
concatenated.md: quality.sum.md perf.sum.md security.sum.md [cite: 38, 39, 40, 41]
	@echo "Concatenating summaries into a single report..."
	@echo "## Code Quality" > concatenated.md [cite: 74, 79]
	@cat quality.sum.md >> concatenated.md [cite: 74, 79]
	@echo "" >> concatenated.md [cite: 79]
	@echo "## Performance" >> concatenated.md [cite: 75, 79]
	@cat perf.sum.md >> concatenated.md [cite: 76, 79]
	@echo "" >> concatenated.md [cite: 79]
	@echo "## Security" >> concatenated.md [cite: 77, 79]
	@cat security.sum.md >> concatenated.md [cite: 78, 79]
refined.md: concatenated.md [cite: 41, 42, 83]
	@echo "Refining concatenated report (removing duplicates, filtering high-signal issues)..."
	@cat concatenated.md | ask "Review this concatenated report containing Code Quality, Performance, and Security sections. Remove any duplicate findings and keep only high-signal, critical issues. Maintain the same three section headings." > refined.md [cite: 48, 85, 86, 87, 89, 90]
clean:
	rm -f concatenated.md refined.md

