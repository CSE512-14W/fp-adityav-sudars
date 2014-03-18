Voice Interfaces for Visually Impaired and Low-Literate Communities in the Developing World
==============
Aditya Vashishta, Sam Sudar {adityav, sudars}@uw.edu

Millions of people cannot access services using conventional graphical user
interfaces. These users include the visually impaired, the low-literate,
speakers of tribal languages without font support, and those without access to
computers or mobile devices. Interactive voice response (IVR) systems provide a
way to interact with users without the need for graphics. Callers are read
options and use the keypad to navigate the content, lowering the barriers for
access and providing the opportunity for engagement. Current IVR systems
provide a wide spectrum of services, including health information, citizen
journalism, and social media. However, little work has been done to inform
the organization of IVR content. We compare list, shallow and deepr hierarchies
to organize content in an IVR system, expanding on similar work that has
focused on graphical user interfaces. We find that both flat lists and deep
hierarchies are inappropriate, and that shallow hierarchies create a more
effective IVR structure.

Below are the hiearchy structures we employed. The list structure is simply a
flat list of the leaf nodes.

![Shallow Hierarchy](https://raw.github.com/CSE512-14W/fp-adityav-sudars/master/shallowHierarchy.png)

![Deep Hierarchy](https://raw.github.com/CSE512-14W/fp-adityav-sudars/master/deepHierarchy.png)

[Poster]
[Final Paper]

## Running Instructions

The code in this project relies on the software Voxeo Prophecy, Express Talk,
SQLServer, and IIS. The code is written in C# and generates aspx files. The
directories must be served using IIS, at which point the `Start.aspx` files may
be run. These files are largely Voice XML files that define the IVR hierachy.
You will have to point Express Talk at these pages to access the IVR.

To create the hierarchy png files from the Graphviz dot files, run a command
similar to the following:

`dot -Tpng shallowHierarchy.dot -o shallowHierarchy.png`

## Work Breakdown

This work is closely tied to Aditya's active area of research on IVR systems.
The project was conceived out of his research. Given that Aditya has a
significant amount of experience designing IVR systems, he also was responsible
for coding the system.

Sam wrote the Graphviz files visualizing the hierarchies and conducted the
majority of the user experiments. He constructed the summary figures using
Tableau and managed the github submissions.

Transforming the experimental design from the GUI-based work to an IVR format
was done by both Sam and Aditya. Both also contributed to the writeup.
