/*
 * WebGL core teaching framwork 
 * (C)opyright Hartmut Schirmacher, hschirmacher.beuth-hochschule.de 
 *
 * Vertex Shader: phong
 *
 * This shader expects a position and normal vector per vertex,
 * and model-view, projection and normal matrices.
 *
 * it transforms the position and normal to eye coordinates and
 * passes them to the fragment shader as varying variables; 
 * it also transforms the position to clip coordinates for the
 * needs of the pipeline.
 *
 */


attribute vec3 vertexPosition;
attribute vec3 vertexNormal;
attribute vec2 vertexTexCoords;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat3 normalMatrix;

// debugging uniforms
uniform bool debug;
uniform vec3 debugColor;
// red color for water (3.4)
uniform vec3 redColor;

varying vec2 texCoords;
varying vec4 ecPosition;
varying vec3 ecNormal;

void main() {
    
    // transform vertex position and normal into eye coordinates
    // for lighting calculations
    ecPosition   = modelViewMatrix * vec4(vertexPosition,1.0);
    ecNormal     = normalize(normalMatrix*vertexNormal);
    texCoords = vertexTexCoords;
    // set the fragment position in clip coordinates
    gl_Position  = projectionMatrix * ecPosition;
    
}

