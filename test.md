<!-- test.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月 16 11:08:10 2018 (+0800)
;; Last-Updated: 一 9月 17 12:58:58 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 11
;; URL: http://wuhongyi.cn -->

# gitbook test

<!-- toc -->

This is a spoiler: {%s%}Hello World.{%ends%}

{%fbq%}Testing the plugin, enter the word "hello" into the field ______, "world" into ______.{%endfbq%}

{%fbq%}Testing. Please type $$hello## (hello) and $$world## (world).{%endfbq%}

## 这是第一部分

<!--sec data-title="Introduction" data-id="section0" data-show=true ces-->

Insert markdown content here (you should start with h3 if you use heading).

<!--endsec-->

<button class="section" target="section1" show="Show next section" hide="Hide next section"></button>


{%mcq ans="o1"%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%endmcq%}

{%mcq ans="o1", count=2%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%hint%} This is a hint.
{%endmcq%}

{%mcq ans="o1", count=2%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%o5%} Fourth option
{%o6%} Fourth option
{%o7%} Fourth option
{%o8%} Fourth option
{%endmcq%}

{%mcq ans="o1", random=true%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%endmcq%}



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
