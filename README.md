<p align="center">
  <a href="http://codely.tv">
    <img src="http://codely.tv/wp-content/uploads/2016/05/cropped-logo-codelyTV.png" width="192px" height="192px"/>
  </a>
</p>

<h1 align="center">
  👁 Check critical files
</h1>

<p align="center">
    <a href="https://github.com/CodelyTV"><img src="https://img.shields.io/badge/CodelyTV-OS-green.svg?style=flat-square" alt="codely.tv"/></a>
    <a href="http://pro.codely.tv"><img src="https://img.shields.io/badge/CodelyTV-PRO-black.svg?style=flat-square" alt="CodelyTV Courses"/></a>
    <a href="https://github.com/marketplace/actions/check-critical-files"><img src="https://img.shields.io/github/v/release/CodelyTV/check-critical-files?style=flat-square" alt="GitHub Action version"></a>
</p>

<p align="center">
    Warns you when critical files are modified
</p>

## 🚀 Usage

Create a file named `checker.yml` inside the `.github/workflows` directory and paste:

```yml
jobs:
  check-critical-files:
    runs-on: ubuntu-latest
    name: Check for critical files
    steps:
      - uses: codelytv/check-critical-files@v1
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          critical_message: Take a look, you've commited some <b>critical file</b>
          critical_files: |
            .env
            action.yml
```

> `critical_message` accepts `html` format.

## ⚖️ License

[MIT](LICENSE)
