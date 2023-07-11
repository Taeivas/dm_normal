client
    verb
        Tutorial()
            var
                icon
                    // Create a blank icon to store icons into.
                    ico = new

                    // Define the diffuse icon for the render.
                    diffuse = icon('art/stairs.dmi', "diffuse")

                    // Define the normal icon for the render.
                    normal = icon('art/stairs.dmi', "normal")

                    // Define the normal icons for positive and negative color vectors.
                    normal_pos
                    normal_neg

                    // Create the light direction icon for the render.
                    light = icon('art/stairs.dmi', "")

                    // Define the light direction icons for positive and negative color vectors.
                    light_pos
                    light_neg

                    // Define the illumination icon for the render.
                    illumination

                    // Define the render icon for the render.
                    render
            
            // Insert the diffuse icon into the render.
            ico.Insert(diffuse, "diffuse")

            // Clone the normals to positive and negative.
            normal_pos = icon(normal)
            normal_neg = icon(normal)
            
            /*
            Adjust the colors in the positive normal by doubling their values.
            Then, shift the scale to the left, effectively truncating the lower half.
            This operation ensures that only values above 127 are retained.
            */
            normal_pos.MapColors(
                2, 0, 0,
                0, 2, 0,
                0, 0, 2,
                -1, -1, -1
            )
            /*
            Alter the colors in the negative normal by inverting and doubling their values.
            Then, shift the scale to the right to emphasize lower values,
            ensuring that only values less than 128 are preserved.
            */
            normal_neg.MapColors(
                -2, 0, 0,
                0, -2, 0,
                0, 0, -2,
                1, 1, 1
            )
            // Insert the normal icons into the render.
            ico.Insert(normal, "normal")
            ico.Insert(normal_pos, "normal_pos")
            ico.Insert(normal_neg, "normal_neg")

            // Determine the direction you want to shine light from..
            var
                x = 1 // Assign the direction on the X axis.
                y = 1 // Assign the direction on the Y axis.
                z = 1 // Assign the direction on the Z axis.
                magnitude = sqrt(x ** 2 + y ** 2 + z ** 2) // Determine the magnitude.
            // Normalize the axis.
            x /= magnitude
            y /= magnitude
            z /= magnitude
            // Create the light direction color.
            var
                r = 128 + x * 128
                g = 128 + y * 128
                b = 128 + z * 128
            light.DrawBox(rgb(r, g, b), 1, 1, light.Width(), light.Height())

            // Clone the light directions to positive and negative.
            light_pos = icon(light)
            light_neg = icon(light)

            /*
            Adjust the colors in the positive normal by doubling their values.
            Then, shift the scale to the left, effectively truncating the lower half.
            This operation ensures that only values above 127 are retained.
            */
            light_pos.MapColors(
                2, 0, 0,
                0, 2, 0,
                0, 0, 2,
                -1, -1, -1
            )
            /*
            Alter the colors in the negative normal by inverting and doubling their values.
            Then, shift the scale to the right to emphasize lower values,
            ensuring that only values less than 128 are preserved.
            */
            light_neg.MapColors(
                -2, 0, 0,
                0, -2, 0,
                0, 0, -2,
                1, 1, 1
            )
            ico.Insert(light, "light")
            ico.Insert(light_pos, "light_pos")
            ico.Insert(light_neg, "light_neg")

            // Determine the amount of light cast into the normals and coinvert it into grayscake
            light_pos *= normal_pos
            light_neg *= normal_neg
            light_pos.MapColors(
                0.66, 0.66, 0.66,
				0.66, 0.66, 0.66,
				0.66, 0.66, 0.66
            )
            light_neg.MapColors(
                0.66, 0.66, 0.66,
				0.66, 0.66, 0.66,
				0.66, 0.66, 0.66
            )
            ico.Insert(light_pos, "light_pos * normal_pos")
            ico.Insert(light_neg, "light_neg * normal_neg")

            // Add the positive and negative lights together to illumination.
            illumination = light_pos + light_neg
            ico.Insert(illumination, "illumination")

            // Do the full render by multiplying the diffuse icon with illumination
            // and multiplying that by the light color.
            var/light_color = rgb(255, 255, 255)
            render = diffuse * illumination * light_color
            ico.Insert(render, "render")

            // Add a reduced color palette version of the render for bonus.
            var/colors = 6
            render /= 255 / (colors - 1)
            render *= 255 / (colors - 1)
            ico.Insert(render, "render_reduced")

            // Write the sample images.
            fcopy(ico, "samples/ico.dmi")
            var/states[] = ico.IconStates()
            for(var/state in states)
                fcopy(icon(ico, state), "samples/[state].png")

            src << "FINISHED RENDER!"