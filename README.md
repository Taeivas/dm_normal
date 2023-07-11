# Normal Map Rendering Tutorial

This repository provides an in-depth tutorial on how to render icons using normal maps in Dream Maker (DM). This tutorial aims to help both beginner and experienced coders enhance their skills and understanding of advanced icon manipulation in DM. 

The tutorial covers several critical concepts such as setting up icons, defining and manipulating icon colors, setting the direction of the light, illuminating the scene, and the final rendering process. Each section is elaborated with appropriate code snippets, complemented by visual aids to ensure a clear understanding of the concepts. 

## Diffuse
A diffuse map in rendering is a texture that defines the base color and surface properties of an object, determining how it interacts with light and appears without any additional effects like reflections or specular highlights.

<img src="./samples/diffuse.png" title="Diffuse" width="96" height="96">

## Normal
A normal map in 2D rendering is an image that encodes surface normals, providing the illusion of fine surface details and enhancing the appearance of lighting on flat objects.

<img src="./samples/normal.png" title="Normal" width="96" height="96">
<img src="./samples/normal_pos.png" title="Positive Normal" width="96" height="96">
<img src="./samples/normal_neg.png" title="Negative Normal" width="96" height="96">

## Lighting
Lighting in this tutorial covers global light in 2D rendering for normal maps, it determines the illumination of pixels with normal maps.

<img src="./samples/light.png" title="Light" width="96" height="96">
<img src="./samples/light_pos.png" title="Positive Light" width="96" height="96">
<img src="./samples/light_neg.png" title="Negative Light" width="96" height="96">

## Illumination
Illumination simulates light interaction with the surface represented by the normal maps, resulting in the realistic portrayal of light and shadows on the object.

<img src="./samples/illumination.png" title="Illumination" width="96" height="96">

## Render
<img src="./samples/render.png" title="Render" width="96" height="96">
<img src="./samples/render_reduced.png" title="Render - Reduced Colors" width="96" height="96">