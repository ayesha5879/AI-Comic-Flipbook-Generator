<?php
$data = json_decode(file_get_contents("php://input"), true);

if (!empty($data['image']) && !empty($data['filename'])) {
    $img = str_replace('data:image/png;base64,', '', $data['image']);
    $img = str_replace(' ', '+', $img);
    $fileData = base64_decode($img);

    $savePath = '../assets/canvas_image/' . basename($data['filename']);

    if (file_put_contents($savePath, $fileData)) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to write image']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Missing image data']);
}
