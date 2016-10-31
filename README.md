# github-pullrequest-step
github pull request step in wercker

### how to use

Add ${user}.(ex: kakura)

Add ${repository}.Github repository name

Add ${token}.Github token

Add ${title}.pull title

Add ${body}.pull body

Add ${from}.from branch name

Add ${to}.to branch name


```yaml
build:
  steps:
    - kakura/github-pullrequest:
        user: ${user}
        repository: ${repository}
        token: ${token}
        title: ${title}
        body: ${body}
        from: ${from}
        to: ${to}
```
