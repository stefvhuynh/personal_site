Personal Site
=============

This is my personal website and blog. There is a home page with my bio,
credentials, and some sample projects. There is also a blog with posts
that visitors comment on, as well as a user interface for the owner of
the blog to add and edit posts. I also plan on implementing tags and 
a recent posts list.

The user can post with raw html so that the output is formatted in a
manner that he/she specifies. I have also implemented syntax highlighting
for posting about code with the 
[Coderay gem](https://github.com/rubychan/coderay). The user simply
needs to put their code between html code tags. I do this by parsing
the posts and using a regex to capture text between code tags. I then
apply the coderay function and add replace the original text with the
highlighted text.
