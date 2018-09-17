<!-- test.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月 16 11:08:10 2018 (+0800)
;; Last-Updated: 一 9月 17 12:19:43 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 8
;; URL: http://wuhongyi.cn -->

# gitbook test

<!-- toc -->


## 这是第一部分

<!--sec data-title="Introduction" data-id="section0" data-show=true ces-->

Insert markdown content here (you should start with h3 if you use heading).

<!--endsec-->

<button class="section" target="section1" show="Show next section" hide="Hide next section"></button>


## 这是第二部分

### ace

{%ace edit=true, lang='c_cpp'%}
// This is a hello world program for C.
#include <stdio.h>

int main(){
  printf("Hello World!");
  return 1;
}
{%endace%}

### mermaid

{% mermaid %}
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
{% endmermaid %}

## 这是第三部分

### katex

Inline math: $$\int_{-\infty}^\infty g(x) dx$$

Block math:

$$
\int_{-\infty}^\infty g(x) dx
$$

### alerts

Info styling

> **[info] For info**
>
> Use this for infomation messages.

Warning styling

> **[warning] For warning**
>
> Use this for warning messages.

Danger styling

> **[danger] For danger**
>
> Use this for danger messages.

Success styling

> **[success] For success**
>
> Use this for success messages.



<!-- test.md ends here -->
