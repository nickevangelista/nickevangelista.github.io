# nickevangelista's blog

This is the repository for nickevangelista's personal blog.

## Tech Stack

*   **Static Site Generator:** [Hugo](https://gohugo.io/)
*   **Theme:** [Hextra](https://imfing.github.io/hextra/)

## Project Structure

*   `content/`: Contains the Markdown files for the blog posts and pages.
*   `hugo.toml`: The main configuration file for Hugo.
*   `public/`: The generated static site (created after running Hugo).
*   `run_hugo.sh`: A shell script to start the Hugo development server.
*   `.specs/`: Contains project specifications and planning documents.

## Local Development

To run the blog locally, you can use the provided script. If you are on Windows using WSL, you can run the following command from your terminal:

```bash
wsl bash run_hugo.sh
```

Alternatively, if you are directly inside your WSL environment or on Linux/macOS, you can run:

```bash
./run_hugo.sh
```

This will start the Hugo development server. By default, the site will be accessible at `http://localhost:1313`.
