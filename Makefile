.PHONY: all clean


all: quality.md perf.md security.md [cite: 35, 36, 37]

# 1. Code Quality Analizi [cite: 56]
quality.md: codebase.txt [cite: 34, 35]
	@echo "Running Code Quality Analysis..."
	@cat codebase.txt | ask "Analyze the following code for quality, focusing on readability, structure, and code duplication. Provide exactly 5 to 7 bullet points in the format 'problem -> fix'." > quality.md [cite: 48, 57, 58]

# 2. Performance Analizi [cite: 59]
perf.md: codebase.txt [cite: 34, 36]
	@echo "Running Performance Analysis..."
	@cat codebase.txt | ask "Analyze the following code for performance bottlenecks and inefficiencies. Provide exactly 5 to 7 bullet points in the format 'issue -> optimization'." > perf.md [cite: 48, 60, 61]

# 3. Security Analizi [cite: 62]
security.md: codebase.txt [cite: 34, 37]
	@echo "Running Security Analysis..."
	@cat codebase.txt | ask "Analyze the following code for security vulnerabilities and unsafe patterns. Provide exactly 5 to 7 bullet points in the format 'risk -> mitigation'." > security.md [cite: 48, 64, 65]

clean:
	rm -f quality.md perf.md security.md
