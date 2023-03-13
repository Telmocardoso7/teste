﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Splash.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Splash" %>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <style>
        .l-page-animation {
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
        }
            .l-page-animation_logo svg {
                display: block;
                margin: 0 auto;
            }
            .l-page-animation > * {
                text-align: center;
                animation-fill-mode: both;
            }

            .l-page-animation .l-page-animation_logo {
                animation-duration: 0.5s;
            }


            .l-page-animation .l-page-animation_loading {
                animation-delay: 2.0s;
                animation-duration: 1.0s;
            }


            .l-page-animation .slide-in-bottom {
                animation-name: fadeInBottom
            }

        @keyframes fadeInBottom {
            from {
                opacity: 0;
                transform: translateY(50%);
            }

            to {
                opacity: 1
            }
        }

        .l-page-animation .fade {
            animation-name: fade
        }

        @keyframes fade {
            from {
                opacity: 0;
            }

            to {
                opacity: 1
            }
        }

        .c-spinner__container {
            padding-top: 32px;
        }
        
        .c-spinner__icon {
            margin: 0 auto;
            border-radius: 50%;
            animation-duration: 1s;
            animation-timing-function: cubic-bezier(0.7, 0.8, 0.7, 0.8);
            animation-iteration-count: infinite;
        }
        
        .c-spinner__icon--medium {
            width: 32px;
            height: 32px;
            border: 3px solid #00b2e3;
            animation-name: c-spinner;
            border-color: #00b2e3 #e5e5e5 #e5e5e5 #e5e5e5;
        }

        @keyframes c-spinner {
            to {
                transform: rotate(1turn);
            }
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="l-page-animation" style="">
        <div class="l-page-animation_logo slide-in-bottom"><svg width="194" height="56" viewBox="0 0 194 56" xmlns="http://www.w3.org/2000/svg"> <defs> <linearGradient x1="-.028%" y1="50.069%" x2="99.965%" y2="50.069%" id="a"> <stop stop-color="#16ABE2" offset="0%"></stop> <stop stop-color="#D6DE27" offset="99.72%"></stop> </linearGradient> <linearGradient x1="47.817%" y1="60.922%" x2="51.634%" y2="48.351%" id="b"> <stop stop-color="#76CEEF" offset="0%"></stop> <stop stop-color="#6FC8EB" offset="6.337%"></stop> <stop stop-color="#5AB9E1" offset="15.79%"></stop> <stop stop-color="#39A0D0" offset="27.2%"></stop> <stop stop-color="#0B7DB8" offset="40.02%"></stop> <stop stop-color="#0074B2" offset="42.88%"></stop> <stop stop-color="#0A5A95" offset="52.61%"></stop> <stop stop-color="#154078" offset="64.7%"></stop> <stop stop-color="#1C2D63" offset="76.7%"></stop> <stop stop-color="#212256" offset="88.46%"></stop> <stop stop-color="#221E52" offset="99.68%"></stop> </linearGradient> <linearGradient x1="50.004%" y1="128.49%" x2="50.004%" y2="-16.123%" id="c"> <stop stop-color="#76CEEF" offset="0%"></stop> <stop stop-color="#6FC8EB" offset="5.868%"></stop> <stop stop-color="#5AB9E1" offset="14.62%"></stop> <stop stop-color="#39A0D0" offset="25.19%"></stop> <stop stop-color="#0B7DB8" offset="37.06%"></stop> <stop stop-color="#0074B2" offset="39.71%"></stop> <stop stop-color="#0A5A95" offset="49.98%"></stop> <stop stop-color="#154078" offset="62.75%"></stop> <stop stop-color="#1C2D63" offset="75.42%"></stop> <stop stop-color="#212256" offset="87.83%"></stop> <stop stop-color="#221E52" offset="99.68%"></stop> </linearGradient> <linearGradient x1="64.117%" y1="54.052%" x2="9.83%" y2="24.667%" id="d"> <stop stop-color="#3FA4D3" offset="0%"></stop> <stop stop-color="#339BCD" offset="8.619%"></stop> <stop stop-color="#1484BD" offset="24.02%"></stop> <stop stop-color="#0074B2" offset="32.74%"></stop> <stop stop-color="#0A5A95" offset="44.2%"></stop> <stop stop-color="#154078" offset="58.45%"></stop> <stop stop-color="#1C2D63" offset="72.6%"></stop> <stop stop-color="#212256" offset="86.45%"></stop> <stop stop-color="#221E52" offset="99.68%"></stop> </linearGradient> </defs> <g fill="none" fill-rule="evenodd"> <path d="M-87-115h620v452H-87z"></path> <g fill-rule="nonzero"> <path d="M7.932 13.08c.778.444 1.761.286 2.332-.396 6.489-7.52 17.038-10.312 26.398-7.012a1.854 1.854 0 002.221-.81c.143-.237.222-.507.238-.76a1.927 1.927 0 00-.777-.524c-10.788-3.808-22.94-.571-30.412 8.09-.27.318-.412.698-.444 1.063.127.127.27.254.444.35z" fill="#6FCFEB"></path> <path d="M45.657 6.925c-.444 0-.888.159-1.237.476.38.032.761.174 1.062.444 8.662 7.472 11.898 19.624 8.091 30.411a1.927 1.927 0 01-.523.778h.158c.762 0 1.491-.476 1.761-1.254 3.808-10.787.571-22.939-8.09-30.41a1.903 1.903 0 00-1.222-.445" fill="#7989C6"></path> <path d="M53.573 38.256c3.807-10.787.571-22.939-8.09-30.411a1.902 1.902 0 00-1.063-.444c-.143.127-.27.27-.365.444-.444.777-.286 1.76.396 2.332 7.52 6.488 10.328 17.022 7.012 26.382-.301.84.048 1.777.81 2.22.237.144.507.223.76.239.239-.19.43-.46.54-.762z" fill="#385CAD"></path> <path d="M13.183 49.187c.445-.778.286-1.761-.396-2.332-7.52-6.489-10.328-17.022-7.012-26.382a1.854 1.854 0 00-.81-2.221 2.008 2.008 0 00-.507-.206c-.349.222-.634.539-.777.967-3.808 10.788-.571 22.94 8.09 30.412.238.206.524.349.81.412.222-.159.444-.38.602-.65z" fill="#E0E621"></path> <path d="M28.65.595c-7.979 0-15.8 3.427-21.194 9.661a1.86 1.86 0 00.016 2.46c.032-.381.175-.762.444-1.064 5.41-6.25 13.215-9.677 21.21-9.677 3.094 0 6.22.508 9.234 1.57.317.112.57.302.777.524a1.893 1.893 0 00-1.238-1.92A28.302 28.302 0 0028.651.596" fill="#A0DDF1"></path> <path d="M4.014 17.998c-.762 0-1.491.476-1.761 1.253-3.807 10.788-.571 22.94 8.09 30.412.35.301.794.46 1.222.46.35 0 .682-.096.984-.286a1.717 1.717 0 01-.81-.412C3.079 41.953-.157 29.8 3.65 19.013c.143-.428.428-.761.777-.967a1.73 1.73 0 00-.412-.048" fill="#ECED74"></path> <path d="M49.734 44.316c-.032.381-.174.762-.444 1.063-5.394 6.25-13.199 9.662-21.194 9.662a27.75 27.75 0 01-9.233-1.571 1.927 1.927 0 01-.778-.524 1.893 1.893 0 001.238 1.92 27.75 27.75 0 009.233 1.57c7.98 0 15.8-3.426 21.194-9.66a1.86 1.86 0 00-.016-2.46" fill="#5FC9EB"></path> <path d="M18.879 53.47c10.787 3.807 22.939.571 30.41-8.09.27-.318.413-.699.445-1.064a1.657 1.657 0 00-.444-.364c-.777-.445-1.761-.286-2.332.396-6.489 7.52-17.022 10.328-26.382 7.012a1.854 1.854 0 00-2.221.81 1.708 1.708 0 00-.238.76c.19.254.444.429.762.54z" fill="#00B2E3"></path> <path d="M42.262 34.361c-.984-.824-1.967-.3-2.475.175-2.522 2.38-6.282 5.394-10.851 5.394-4.6 0-8.931-4.125-9.93-8.535 2.617-1.618 7.17-2.586 11.056-2.586 4.188 0 5.505 1.237 7.98 1.237 1.047 0 2.982-.158 4.87-2.443 1.951-2.347 1.11-5.203.555-6.44-2.57-5.711-8.344-9.662-15.023-9.662-7.297 0-16.483 5.426-16.483 17.038 0 9.519 8.82 16.182 16.483 15.944 6.187-.19 10.613-3.125 13.992-7.647.476-.634.793-1.65-.174-2.475zm-5.87-14.277c1.253 1.348.016 3.458-1.539 3.11-1.983-.46-4.109-1.206-8.059-.73-6.091.73-8.455 2.205-8.455 2.205 1.19-3.3 3.807-7.044 8.74-7.663.017 0 5.522-.967 9.313 3.078z" fill="url(#a)" transform="translate(.571 .5)"></path> <path d="M36.392 20.084c-3.791-4.045-9.296-3.078-9.296-3.078-4.934.635-7.552 4.363-8.741 7.663 0 0 1.396-.873 4.79-1.603 1.746-5.917 10.01-5.695 13.247-2.982z" fill="url(#b)" transform="translate(.571 .5)"></path> <path d="M35.345 29.634c-1.317-.365-2.792-.793-5.283-.793-3.886 0-8.44.967-11.057 2.586l3.903.301c3.521-2.395 9.994-2.824 12.437-2.094z" fill="url(#c)" transform="translate(.571 .5)"></path> <path d="M30.744 38.629c-5.996 0-7.836-6.901-7.836-6.901l-3.903-.301c1 4.41 5.315 8.534 9.931 8.534 4.363 0 8.011-2.76 10.518-5.076-1.079.936-4.569 3.744-8.71 3.744z" fill="url(#d)" transform="translate(.571 .5)"></path> <g class="logo-text" fill="#00B2E3"> <path d="M81.272 21.615c-.793-.952-1.777-1.697-2.92-2.253-1.141-.555-2.458-.825-3.918-.825-1.38 0-2.665.27-3.823.81a9.254 9.254 0 00-2.998 2.205 10.14 10.14 0 00-1.967 3.3c-.476 1.253-.698 2.601-.698 4.029 0 1.507.27 2.919.777 4.204.523 1.269 1.237 2.38 2.126 3.268a9.445 9.445 0 003.14 2.11 9.953 9.953 0 003.824.745c1.856 0 3.458-.349 4.743-1.015a11.966 11.966 0 003.395-2.681l.143-.159-2.094-1.888-.143.143c-.777.81-1.65 1.46-2.586 1.951-.92.476-2.062.73-3.379.73a6.856 6.856 0 01-2.363-.412 6.485 6.485 0 01-2.031-1.222c-.619-.54-1.11-1.205-1.491-1.967-.365-.714-.603-1.539-.714-2.443H83.62l.015-.19c.016-.207.048-.429.048-.603v-.428c0-1.428-.206-2.808-.603-4.078-.412-1.269-1.015-2.395-1.808-3.331zm-.952 5.854H68.295a8.42 8.42 0 01.65-2.285 7.42 7.42 0 011.333-2.014c.523-.556 1.142-1 1.856-1.317a5.29 5.29 0 012.237-.476c.92 0 1.745.175 2.443.508a5.283 5.283 0 011.793 1.364 6.638 6.638 0 011.19 2.015 8.3 8.3 0 01.523 2.205zM103.846 21.25a9.442 9.442 0 00-3.046-2.015 9.3 9.3 0 00-3.474-.698c-.936 0-1.76.127-2.522.365a9.49 9.49 0 00-2.063.952 8.84 8.84 0 00-1.665 1.396c-.35.365-.667.746-.968 1.158V10.97h-3.3v27.778h3.3v-3.284c.286.381.603.746.936 1.08a9.373 9.373 0 001.666 1.348c.618.38 1.316.682 2.078.92a9.173 9.173 0 002.538.349c1.19 0 2.38-.238 3.506-.714a9.337 9.337 0 003.03-2.03c.888-.873 1.602-1.968 2.126-3.237.54-1.27.809-2.713.809-4.315v-.08c0-1.618-.27-3.077-.81-4.33a9.709 9.709 0 00-2.14-3.205zm-.428 7.583v.08c0 1.142-.175 2.189-.524 3.061-.364.92-.825 1.666-1.427 2.285a5.89 5.89 0 01-2.094 1.412c-1.603.65-3.443.682-5.093-.032a7.106 7.106 0 01-2.189-1.476 6.7 6.7 0 01-1.523-2.3c-.38-.888-.571-1.904-.571-2.998v-.08c0-1.078.19-2.062.571-2.934.38-.889.888-1.666 1.539-2.3a6.974 6.974 0 012.19-1.492 6.249 6.249 0 012.521-.523c.889 0 1.745.174 2.539.507a6.226 6.226 0 012.11 1.46c.602.634 1.078 1.396 1.443 2.3.333.889.508 1.904.508 3.03zM168.096 18.95h-4.189l-10.153 10.597V18.95h-3.3v19.798h3.3v-5.187l3.697-3.744 6.853 8.931h3.982l-8.55-11.247zM117.696 18.648c-1.444 0-2.73.16-3.84.46-1.11.302-2.22.714-3.3 1.222l-.174.08 1 2.76.206-.095a17.635 17.635 0 012.728-1c.905-.238 1.936-.365 3.078-.365 1.761 0 3.141.429 4.093 1.27.968.856 1.428 2.078 1.428 3.743v.318a20.886 20.886 0 00-2.443-.524c-.92-.159-1.983-.222-3.268-.222-1.254 0-2.396.143-3.411.428-1.031.27-1.935.682-2.697 1.222a5.454 5.454 0 00-1.76 2.046c-.413.825-.62 1.761-.62 2.856v.08c0 1.03.223 1.95.635 2.728.428.777 1 1.427 1.682 1.95.698.524 1.49.921 2.395 1.175.888.254 1.793.38 2.713.38 1.729 0 3.204-.348 4.362-1.015.952-.555 1.761-1.205 2.396-1.92v2.523h3.268V26.692c0-2.507-.698-4.474-2.078-5.854-1.444-1.444-3.601-2.19-6.393-2.19zm5.266 11.121v1.634c0 .746-.158 1.412-.476 2.015a5.216 5.216 0 01-1.316 1.586 6.462 6.462 0 01-1.967 1.031 8.046 8.046 0 01-2.443.365c-.635 0-1.238-.079-1.793-.254a5.006 5.006 0 01-1.491-.713 3.3 3.3 0 01-1-1.143 3.224 3.224 0 01-.365-1.523v-.079c0-1.11.46-1.983 1.396-2.65.952-.681 2.3-1.03 4.046-1.03 1.158 0 2.22.079 3.14.253.794.16 1.571.334 2.27.508zM144.982 20.758a6.82 6.82 0 00-2.396-1.65c-.936-.38-2.015-.586-3.204-.586-1.714 0-3.126.38-4.204 1.142a9.64 9.64 0 00-2.221 2.173v-2.903h-3.3v19.798h3.3V27.47c0-.873.142-1.666.412-2.396a5.538 5.538 0 011.174-1.856 5.301 5.301 0 011.777-1.19 6.033 6.033 0 012.237-.412c1.65 0 2.935.508 3.823 1.491.888 1 1.333 2.396 1.333 4.125v11.501h3.283V26.517c0-1.174-.174-2.253-.523-3.22-.35-.984-.84-1.825-1.491-2.539zM171.03 18.95h3.3v19.798h-3.3zM177.424 18.95v3.315h6.472v16.483h3.316V22.265h6.472V18.95z"></path> </g> </g> </g> </svg></div>
        <div class="l-page-animation_loading fade">
            <div class="c-spinner">
                <div class="c-spinner__container">
                    <div class="c-spinner__icon c-spinner__icon--medium">
                    </div>
                </div>
            </div>
        </div>
        </div>


        <script>
            setTimeout(function () {
                document.location.href = "/";
            }, 300);
        </script>
    </form>
</body>
</html>