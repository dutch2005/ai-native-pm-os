# Module 7.7 — Custom MCP Servers: Building Your Own Connectors

**Time:** ~45 minutes  
**Outcome:** A custom MCP server that connects Claude to an internal tool or database that has no public connector

---

## When to Build a Custom MCP Server

The community MCP registry covers 90% of standard PM tools (Jira, Slack, Notion, Amplitude).

But what about:
- Your company's proprietary admin dashboard?
- A specific PostgreSQL replica database?
- An internal feature flag service (e.g., LaunchDarkly but homegrown)?

When a tool doesn't have a public connector, you build a custom MCP server. It takes about 20 minutes using Claude Code.

---

## The Core Concept of an MCP Server

An MCP server is just a lightweight script (usually Node.js or Python) that sits between Claude and your target system.

It does three things:
1. **Defines Tools:** Tells Claude "Here are the commands I understand" (e.g., `get_user_status`)
2. **Receives Requests:** Takes Claude's request and calls the target system's API or database
3. **Returns Data:** Hands the result back to Claude in a standardized format

---

## Example Scenario: The Internal Admin Tool

Meridian has an internal admin tool (`api.meridian.internal/v1/accounts`) that PMs use to look up customer tier, active seat count, and feature flag status. There is no public MCP connector for this.

We will build a simple Node.js MCP server to connect it.

---

## Step 1: Generate the MCP Server Code

You don't need to write this from scratch. Ask Claude to write it:

```
I need to build a custom MCP server in Node.js to connect to our internal admin API.

The API endpoint is: GET https://api.meridian.internal/v1/accounts/{domain}
Headers required: Authorization: Bearer {process.env.MERIDIAN_ADMIN_TOKEN}

Response format is JSON containing:
- companyName
- tier (Free, Pro, Enterprise)
- activeSeats (integer)
- featuresEnabled (array of strings)

Create a single-file Node.js MCP server using the official @modelcontextprotocol/sdk.
It should expose one tool: "get_account_info" that takes a "domain" argument.

Provide the package.json and the index.js file.
```

*Note: Claude will output the code. Save it to a new directory, e.g., `~/custom-mcp/meridian-admin/`.*

---

## Step 2: Install Dependencies and Build

```bash
# Navigate to your new custom MCP directory
cd ~/custom-mcp/meridian-admin

# Install the MCP SDK and dependencies
npm install

# (If using TypeScript, run the build step)
# npm run build

# Make the script executable
chmod +x index.js
```

---

## Step 3: Connect Claude Code to Your Custom Server

Register your custom server using `claude mcp add`:

```bash
claude mcp add \
  -e MERIDIAN_ADMIN_TOKEN=your-internal-api-token \
  meridian_admin -- node /Users/yourname/custom-mcp/meridian-admin/index.js
```

Verify it's registered:
```bash
claude mcp list
# Should show: meridian_admin
```

Start a new Claude Code session for the new server to load.

---

## Step 4: Test Your Custom Integration

Now you can interact with your internal system directly from Claude:

```
Use the meridian_admin MCP tool to look up the account info for "coastalops.com".
What tier are they on, and do they have the "conditional_routing" feature flag enabled?
```

If the API is reachable and the token is valid, Claude will return the live data.

---

## Real-World Use Cases for Custom MCP Servers

**1. The Database Direct Query:**
A Python MCP server that securely connects to a read-only replica of your PostgreSQL database, allowing Claude to run complex SQL queries for you without waiting for the data team.

**2. The Feature Flag Manager:**
A Node.js server that connects to your feature flag API, allowing you to ask: "Which customers currently have the V2 UI flag turned on?"

**3. The Documentation Scraper:**
A Python server that connects to an internal, authenticated Confluence or Wiki instance that standard connectors can't reach, enabling semantic search across proprietary company knowledge.

---

## The "Build It For Me" Prompt

If you encounter an internal system you want to connect, use this meta-prompt:

```
I want to connect Claude Code to an internal tool via MCP.

Here is what the tool does: [describe tool]
Here is how I currently access its data: [API / database / script]
Here is an example of the data structure: [paste JSON or table sample]

Write the complete code for a custom MCP server (prefer Node.js or Python) 
that exposes 2-3 useful tools for a Product Manager interacting with this system.
Include setup instructions and the `claude mcp add` command to register it.
```

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Node.js or Python environment set up for custom scripts
- [ ] Example MCP server code generated for an internal API or database
- [ ] Custom server registered with `claude mcp add` and visible in `claude mcp list`
- [ ] You can explain the three parts of an MCP server to an engineer

---

## Module 7 Complete ✅

You now have a fully connected PM OS:
- 7-1: Setup & configuration overview
- 7-2: Jira (closing the PRD-to-ticket gap)
- 7-3: Slack (automated updates and alerts)
- 7-4: Amplitude (closing the analytics data loop)
- 7-5: Notion (syncing PRDs and meeting notes)
- 7-6: Google Workspace (Gmail and Calendar prep)
- 7-7: Custom MCP servers (connecting internal tools)

**Start Module 8:**
```
/start-m8-1
```

*Module 8: The PM Vault — organizational systems and decision logs.*
