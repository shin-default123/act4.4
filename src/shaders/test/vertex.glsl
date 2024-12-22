uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
attribute vec3 position;
attribute float aRandom;
varying float vRandom;
uniform vec2 uFrequency;
uniform float uTime;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    // Pass random attribute to fragment shader
    vRandom = aRandom;

    // Final position after applying view and projection matrices
    gl_Position = projectionMatrix * viewMatrix * modelPosition;
}
