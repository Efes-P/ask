.PHONY: all clean

	@echo "Running Code Quality Analysis..."
	@cat codebase.txt | ask "Analyze the following code for quality, focusing on readability, structure, and code duplication. Provide exactly 5 to 7 bullet points in the format 'problem -> fix'." 

	@echo "Running Performance Analysis..."
	@cat codebase.txt | ask "Analyze the following code for performance bottlenecks and inefficiencies. Provide exactly 5 to 7 bullet points in the format 'issue -> optimization'." 

	@echo "Running Security Analysis..."
	@cat codebase.txt | ask "Analyze the following code for security vulnerabilities and unsafe patterns. Provide exactly 5 to 7 bullet points in the format 'risk -> mitigation'." 

clean:
	rm -f quality.md perf.md security.md


	@echo "Summarizing Code Quality Report..."
	@cat quality.md | ask "Compress the following quality analysis into exactly 5 bullet points. Keep only the most critical, actionable items." 

	@echo "Summarizing Performance Report..."
	@cat perf.md | ask "Compress the following performance analysis into exactly 5 bullet points. Keep only the most critical, actionable items."

	@echo "Summarizing Security Report..."
	@cat security.md | ask "Compress the following security analysis into exactly 5 bullet points. Keep only the most critical, actionable items."
