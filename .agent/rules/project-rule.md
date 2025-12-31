---
trigger: always_on
---

## Project Rules

1. **Flexibility & Accessibility**: This is a NixOS flake configuration intended for multiple devices and public use. Always aim for flexibility, accessibility, and ease of maintenance/installation for all users.
2. **Structured Planning**: Never execute code without a plan. Plans must include:
    - *Objective*: What we are solving.
    - *Files*: Which modules/files will be created or modified.
    - *Risk*: Potential breaking changes or conflicts.
    - *Alternatives*: Why this method was chosen over others.
3. **Latest Nix Information**: Prioritize the latest Nix information (e.g., 25.xx, 26.xx). Use older information only if newer versions are unavailable and the old methods are still functional.
4. **Frequent Commits**: Commit every time a file is added or updated with a short, 3-word message in all lowercase. Each commit should contain only one file.
5. **Safety First**: Prioritize system stability. Avoid code that could break the OS, hosts, or system.
6. **Modularization**: Always modularize code for better organization and convenience.
7. **User Experience**: Constantly consider the installation experience for other users and look for ways to improve it.
8. **Proactive Research**: Always conduct research to ensure accuracy and modernity before planning or editing. Verify that solutions align with the current state of the ecosystem (NixOS 25.xx/26.xx).
9. **Documentation & Sourcing**: Detailed references are required. Always include wiki pages (e.g., NixOS Wiki or hyprland Wiki) or official documentation links for any tools, options, or methods implemented.
10. **Never Commit .agent**: Never comit .agent but never add it to .gitignore. Why? because i, dont want this rule to be publicly pushed and not gonna make you can't read this rules too.