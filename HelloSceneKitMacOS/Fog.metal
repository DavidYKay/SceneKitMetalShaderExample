// // Fog vertex shader function
// vertex ColorInOut fog_vertex(device packed_float3* vertices [[ buffer(0) ]],
//                              device packed_float3* normals [[ buffer(1) ]],
//                              constant AAPL::uniforms_t& uniforms [[ buffer(2) ]],
//                              unsigned int vid [[ vertex_id ]])
// {
//     ColorInOut out;
//     
//     float4x4 model_matrix = uniforms.model_matrix;
//     float4x4 view_matrix = uniforms.view_matrix;
//     float4x4 projection_matrix = uniforms.projection_matrix;
//     float4x4 mvp_matrix = projection_matrix * view_matrix * model_matrix;
//     float4x4 model_view_matrix = view_matrix * model_matrix;
//     
//     // Calculate the position of the object from the perspective of the camera
//     float4 vertex_position_modelspace = float4(float3(vertices[vid]), 1.0);
//     out.position = mvp_matrix * vertex_position_modelspace;
//     
//     // Calculate the normal from the perspective of the camera
//     float3 normal = normals[vid];
//     out.normal_cameraspace = (normalize(model_view_matrix * float4(normal, 0.0))).xyz;
//     
//     // Calculate the view vector from the perspective of the camera
//     float3 vertex_position_cameraspace = ( view_matrix * model_matrix * vertex_position_modelspace ).xyz;
//     out.eye_direction_cameraspace = float3(0,0,0) - vertex_position_cameraspace;
//     
//     // Calculate the direction of the light from the position of the camera
//     float3 light_position_cameraspace = ( view_matrix * float4(light_position,1)).xyz;
//     out.light_direction_cameraspace = light_position_cameraspace + out.eye_direction_cameraspace;
//     
//     // Calculate the distance to the object which is used for how much fog obsures the object
//     float4 position_modelviewspace = model_view_matrix * float4(float3(vertices[vid]), 1.0);
//     out.distance_to_object = abs(position_modelviewspace.z/position_modelviewspace.w);;
//     
//     return out;
// }
