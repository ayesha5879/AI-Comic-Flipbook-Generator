function theKingIsBlackPageCallback(n) {
    let timestamp = new Date().getTime();
    return {
        type: 'image',
        src: `/efest/assets/canvas_image/page${n+1}.png?t=${timestamp}`,
        interactive: false
    };
}

function waitForImagesToLoad(container) {
    const images = container.querySelectorAll("img");
    return Promise.all(Array.from(images).map(img => {
        if (img.complete) return Promise.resolve();
        return new Promise(resolve => img.onload = img.onerror = resolve);
    }));
}

$(document).ready(()=>{

    // SignUp page
    $('#signup_form').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);
        formData.append("siginup", true);

        $.ajax({
            url: "/efest/handler/main",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response, status) {
                console.log(response);
                if(response == "successfully"){
                    window.location.href = "/efest/signin";
                }else{
                    alert(response);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });

    });

    // SignIn page
    $('#signin_form').on('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);
        formData.append("siginIn", true);

        $.ajax({
            url: "/efest/handler/main",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response, status) {
                console.log(response);
                if(response == "successfully"){
                    window.location.href = "/efest";
                }else{
                    alert(response);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });

    });

    $('#logout').on('click', function(e) {
        e.preventDefault();
        console.log("logout");
        var formData = new FormData();
        formData.append("logout", true);

        $.ajax({
            url: "/efest/handler/main",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response, status) {
                console.log(response);
                window.location.href = "/efest";
                // if(response.indexOf("successfully")){
                    
                // }else{
                //     alert(response);
                // }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });

    });

    $('#prompt_btn').on('click', async function (e) {

        e.preventDefault();
        $("#book_container").html("");
        $("#render_pages").html("");

        $(".loading").show();

        $("#render_pages").append(`<div class="render_page" id="page_0">
                                        
                                    </div>`);

        

        const msg = $("#prompt_msg").val();
        const formData = new FormData();
        formData.append("prompt_generate", true);
        formData.append("prompt_msg", msg);

        $.ajax({
            url: "/efest/api/api_handler",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: async function (response) {
                if (!Array.isArray(response)) {
                    console.error("Unexpected response format.");
                    return;
                }

                const pageCount = response.length;

                // Build pages (image + text alternates)
                for (let i = 1; i <= pageCount; i++) {
                    const chapter = response[i-1].chapter;
                    const image = response[i-1].image;
                    let image_url = `/efest/assets/flipbook_images/${image}`;
                    
                    if(image == ""){
                        image_url = "/efest/assets/images/not_found.jpg";
                    }

                    const imagePage = `
                        <div class="render_page" id="page_${i}">
                            <div class="book_img">
                                <img src="${image_url}" style="height: 100%; width: 100%;"/>
                            </div>
                            <p class="book_content my_book_text" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif">${chapter.replace(/\n/g, "<br>")}</p>
                        </div>`;

                    $('#render_pages').append(imagePage);
                }

                $(".loading").hide();

                $("#render_pages").append(`<div class="render_page" id="page_7">
                                        <img class="book_img" src="/efest/assets/images/comic_front_page.jpg" style="height: 100%; wiidth: 100%; object-fit: fill;" />
                                    </div>`);

                // Convert to canvas images and save
                for (let i = 0; i < pageCount + 2; i++) {
        
                    const el = document.getElementById(`page_${i}`);
                    console.log(el);
                    if (!el) continue;

                    await waitForImagesToLoad(el);
                    const canvas = await html2canvas(el);
                    const imgData = canvas.toDataURL("image/png", 0.9);

                    const rs = await fetch('/efest/includes/save_image', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({
                            image: imgData,
                            filename: `page${i + 1}.png`
                        })
                    });

                    await rs.json();
                }

                const totalPages = $('.render_page').length;

                // Initialise FlipBook
                $('#book_container').FlipBook({
                    pageCallback: theKingIsBlackPageCallback,
                    pages: totalPages - 2, // need to remove - 2 while using wth live api
                    propertiesCallback: function (props) {
                        props.cover.color = 0x000000;
                        return props;
                    },
                    template: {
                        html: '/efest/includes/default-book-view.html',
                        styles: ['/efest/assets/css/short-white-book-view.css'],
                        links: [
                            {
                                rel: 'stylesheet',
                                href: '/efest/assets/css/font-awesome.min.css'
                            }
                        ],
                        script: '/efest/assets/js/default-book-view.js',
                        sounds: {
                            startFlip: '/efest/assets/sounds/start-flip.mp3',
                            endFlip: '/efest/assets/sounds/end-flip.mp3'
                        }
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
         });


    

    });

    $('#update_user').on('click', function (e) {
        e.preventDefault();

        const formData = new FormData();
        formData.append("fname", $('#fname').val());
        formData.append("lname", $('#lname').val());
        formData.append("pass", $('#password').val());
        formData.append("phone", $('#phone').val());
        formData.append("update_profile", true);

        $.ajax({
            url: '/efest/handler/main',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                console.log(response);
                // window.location.href = "/efest";
            },
            error: function (xhr, status, error) {
                $('#account_data_table').html('<p class="text-danger">Error saving data. Please try again.</p>');
                console.error('Error:', error);
            }
        });
    });



getHistory();

// Page Transaction

barba.init({
  transitions: [{
    name: 'slide',
    leave(data) {
      return new Promise(resolve => {
        const current = data.current.container;
        current.style.transition = 'transform 0.8s ease-in-out';
        current.style.transform = 'translateX(-100%)';
        setTimeout(() => resolve(), 800);
      });
    },
    enter(data) {
      const next = data.next.container;
      next.style.transform = 'translateX(100%)';
      next.style.transition = 'transform 0.8s ease-in-out';
      requestAnimationFrame(() => {
        next.style.transform = 'translateX(0%)';
      });
      return new Promise(resolve => {
        setTimeout(() => resolve(), 800);
      });
    }
  }]
});

barba.hooks.after(() => {
  document.querySelectorAll('[data-barba="container"]').forEach(el => {
    el.style.transform = '';
    el.style.transition = '';
  });
});



});

function getHistory() {

    $.ajax({
        url: '/efest/handler/main',
        type: 'POST',
        data: { "fetch_history": 1 },
        dataType: 'json',
        success: function(data) {
            const sidebar = $('#history_bar');
            $('#history_bar').html("");

            if (data.length === 0) {
                $('#history_bar').html("<p>No history found.</p>");
                return;
            }

            data.forEach(function(item) {
                const html = `
                    <div class="history-item">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <div onclick="make_book_with_history(${item.id})">
                                <p style="margin: 0;">${item.prompt}</p>
                                <p style="margin: 0; font-size: 12px;">${item.date}</p>
                            </div>
                            <div class="menu-dots" onclick="toggleMenu(${item.id})" style="cursor:pointer;">⋮
                                <div class="dropdown-menu morph" id="menu-${item.id}" style="display:none; position:absolute; background:white; color:black; border-radius:4px; padding:4px;">
                                    <div onclick="deletePrompt(${item.id})"><i class="fa-solid fa-trash"></i> Delete</div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                sidebar.append(html);
            });
        },
        error: function(xhr, status, error) {
            console.error("History error:", error);
        }
    });
}

function toggleMenu(id) {
    $(".dropdown-menu").hide();
    $("#menu-" + id).toggle();
    event.stopPropagation();
}

$(document).on("click", function () {
    $(".dropdown-menu").hide();
});

function make_book_with_history(id) {

    event.preventDefault();
    $(".loading").show();
    // Destroy FlipBook instance if exists
    if ($('#book_container').data('flipbook')) {
        $('#book_container').data('flipbook').destroy();
        $('#book_container').removeData('flipbook');
    }

    // Clear previous pages & container
    $('#render_pages').empty();
    $('#book_container').empty();

    $("#render_pages").append(`<div class="render_page" id="page_0">
                                    
                                </div>`);

    
    const formData = new FormData();
    formData.append("get_book_by_history", true);
    formData.append("id", id);

    $.ajax({
        url: "/efest/handler/main",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: async function (response) {
            if (!Array.isArray(response)) {
                console.error("Unexpected response format.");
                return;
            }

            const pageCount = response.length;

            // Build pages (image + text alternates)
            for (let i = 1; i <= pageCount; i++) {
                const chapter = response[i-1].chapter;
                const image = response[i-1].image;
                let timestamp = new Date().getTime();
                let image_url = `/efest/assets/flipbook_images/${image}?v=${timestamp}`;
                
                if(image == ""){
                    image_url = "/efest/assets/images/not_found.jpg";
                }

                
                const imagePage = `
                    <div class="render_page" id="page_${i}">
                        <div class="book_img" style="background-image: url('${image_url}');">
                            
                        </div>
                        <p class="book_content my_book_text" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif">${chapter.replace(/\n/g, "<br>")}</p>
                    </div>`;

                $('#render_pages').append(imagePage);
            }

            $("#render_pages").append(`<div class="render_page" id="page_7">
                                    <img class="book_img" src="/efest/assets/images/comic_front_page.jpg" style="height: 100%; wiidth: 100%; object-fit: fill;" />
                                </div>`);

            // Convert to canvas images and save
            for (let i = 0; i < pageCount + 2; i++) {
    
                const el = document.getElementById(`page_${i}`);
                console.log(el);
                if (!el) continue;

                await waitForImagesToLoad(el);
                const canvas = await html2canvas(el);
                const imgData = canvas.toDataURL("image/png", 0.9);

                const rs = await fetch('/efest/includes/save_image', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        image: imgData,
                        filename: `page${i + 1}.png`
                    })
                });

                await rs.json();
            }
            $(".loading").hide();

            const totalPages = $('.render_page').length;

            // Initialise FlipBook
            $('#book_container').FlipBook({
                pageCallback: theKingIsBlackPageCallback,
                pages: totalPages - 2, // need to remove - 2 while using wth live api
                propertiesCallback: function (props) {
                    props.cover.color = 0x000000;
                    return props;
                },
                template: {
                    html: '/efest/includes/default-book-view.html',
                    styles: ['/efest/assets/css/short-white-book-view.css'],
                    links: [
                        {
                            rel: 'stylesheet',
                            href: '/efest/assets/css/font-awesome.min.css'
                        }
                    ],
                    script: '/efest/assets/js/default-book-view.js',
                    sounds: {
                        startFlip: '/efest/assets/sounds/start-flip.mp3',
                        endFlip: '/efest/assets/sounds/end-flip.mp3'
                    }
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("Error:", error);
        }
    });
}

function deletePrompt(promptId) {

    const formData = new FormData();
    formData.append("delete_prompt", true);
    formData.append("id", promptId);

    $.ajax({
        url: "/efest/handler/main",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            getHistory();
        }
        }
    )
}