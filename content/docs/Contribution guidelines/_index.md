---
title: "Contribution Guidelines"
linkTitle: "Contribution Guidelines"
weight: 1000
description: >
  How to contribute to the docs
---

These docs are built with [Hugo](https://gohugo.io/) and the [Docsy theme](https://github.com/google/docsy). Pages are written in Markdown and HTML.

## Updating a single page

If you've just spotted something you'd like to change while using the docs, Docsy has a shortcut for you:

1. Click **Edit this page** in the top right hand corner of the page.
1. If you don't already have an up to date fork of the project repo, you are prompted to get one - click **Fork this repository and propose changes** or **Update your Fork** to get an up to date version of the project to edit. The appropriate page in your fork is displayed in edit mode.

## Previewing your changes locally

{{% pageinfo %}}
Clone the docs repo:

```sh
git clone https://github.com/uor-framework/uor-framework.github.io.git
cd uor-framework.github.io
```

Start with podman:

```sh
podman play kube podman.yaml
podman logs --follow uor-framework-hugo
```

Start with docker-compose:

```sh
docker-compose up
```

Open the docs locally at [http://localhost:1313](http://localhost:1313)

{{% /pageinfo %}}



## Creating an issue

If you've found a problem in the docs, but you're not sure how to fix it yourself, please create an issue in the [github pages repo](https://github.com/uor-framework/uor-framework.github.io/issues). You can also create an issue about a specific page by clicking the **Create Issue** button in the top right hand corner of the page.

## Useful resources

* [Docsy user guide](https://www.docsy.dev/docs/): All about Docsy navigation, look, and feel.
* [Hugo documentation](https://gohugo.io/documentation/): Comprehensive reference for Hugo.
