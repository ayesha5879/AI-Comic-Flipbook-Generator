<?php
    $page_title = "About";
    session_start();
    include_once("./includes/header.php");
?>

<div class="main_box main_bg" data-barba="container" data-barba-namespace="settings">
<?php
    include_once("./includes/navbar.php");
?>
<div class="container-fluid wrapper py-5">
    
    <div class="col-12 col-sm-10 col-md-8 col-lg-6  morph p-5" style="height:80vh; overflow-y: auto;">
            <h1 class="text-center mb-4">About Our Platform</h1>
            <p class="lead text-center">
                Empowering imagination through AI-generated storytelling and visual storytelling.
            </p>
            
            <hr>

            <h3>What We Do</h3>
            <p>
                Our platform combines the power of advanced language models and image generation technology to bring user ideas to life. By simply entering a prompt, users can generate rich, engaging stories and instantly transform them into illustrated comic books.
            </p>

            <h3>How It Works</h3>
            <ol>
                <li><strong>Input a Prompt:</strong> Users submit a creative idea or a brief storyline.</li>
                <li><strong>Story Generation:</strong> Using GPT-based AI, the platform crafts a coherent and compelling narrative based on the user's input.</li>
                <li><strong>Visual Transformation:</strong> Our image generation engine visualizes the story into sequential comic-style panels.</li>
                <li><strong>Export & Share:</strong> Users can save, download, or share their AI-generated comic books.</li>
            </ol>

            <h3>Who It's For</h3>
            <p>
                Whether you're a budding writer, comic enthusiast, educator, or simply someone with a vivid imagination, our platform offers an intuitive and fun way to express stories. No design skills or writing experience needed — just your ideas.
            </p>

            <h3>Our Vision</h3>
            <p>
                We envision a world where storytelling is universally accessible. With the aid of AI, we aim to remove the traditional barriers to creative expression and allow anyone to become an author and visual storyteller in minutes.
            </p>

            <h3>Why It Matters</h3>
            <p>
                Stories are powerful. They educate, inspire, and connect us. By blending cutting-edge AI with storytelling, our platform democratizes creativity and opens new doors for innovation in entertainment, education, and digital art.
            </p>

            <div class="text-center mt-5">
                <a href="index" class="btn btn-primary px-4">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<?php
    include_once("./includes/footer.php");
?>
