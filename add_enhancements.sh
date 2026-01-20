#!/bin/bash

# Script to add enhancements to all topic READMEs
# Adds: Prerequisites, Common Mistakes, Command Reference, Quick Reference sections

echo "Adding enhancements to all topics..."

# Function to add enhancements before "Key Takeaways"
add_enhancements() {
    local file=$1
    local topic_name=$2
    
    # Check if enhancements already added
    if grep -q "## 📋 Prerequisites" "$file"; then
        echo "  ✓ Enhancements already exist in $file"
        return
    fi
    
    # Find the line before "Key Takeaways"
    local line_num=$(grep -n "## 🎯 Key Takeaways" "$file" | cut -d: -f1)
    
    if [ -z "$line_num" ]; then
        echo "  ⚠️  Could not find 'Key Takeaways' in $file"
        return
    fi
    
    # Create temp file with enhancements
    local temp_file=$(mktemp)
    
    # Copy everything before Key Takeaways
    head -n $((line_num - 1)) "$file" > "$temp_file"
    
    # Add enhancements
    cat >> "$temp_file" << EOF

---

## 📋 Prerequisites

Before starting this topic, you should understand:
- Previous topics in the learning path
- Basic networking concepts

**Estimated Time:** 2-3 hours

---

## ⚠️ Common Mistakes

### Common Mistake
\`\`\`
❌ Wrong: [Common mistake example]
✅ Correct: [Correct approach]
\`\`\`

---

## 🛠️ Command Reference

### Essential Commands
\`\`\`bash
# Add relevant commands for this topic
\`\`\`

---

## 📊 Quick Reference Card

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│              QUICK REFERENCE                                │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  Key Points:                                                │
│    • Point 1                                                │
│    • Point 2                                                │
│    • Point 3                                                │
│                                                              │
└─────────────────────────────────────────────────────────────┘
\`\`\`

---
EOF
    
    # Copy Key Takeaways and rest
    tail -n +$line_num "$file" >> "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    echo "  ✅ Enhanced $file"
}

# Add enhancements to all topics
for dir in */; do
    if [ -f "${dir}README.md" ] && [[ "$dir" =~ ^[0-9] ]]; then
        echo "Processing $dir"
        add_enhancements "${dir}README.md" "$dir"
    fi
done

echo "✅ Enhancements added to all topics!"
