---
title: Support Section
permalink: /support/
---

<ul>
{% for item in site.support %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>
