<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<link href="resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" id="camera-css"  href="resources/css/camera.css" type="text/css" media="all">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/theme.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/skin.css" />
<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
    <main>
        <div class="page_container">
            <!--slider-->
            <div id="main_slider">
                <div class="camera_wrap" id="camera_wrap_1">
                    <div data-src="resources/imgs/slider/1.jpg"></div>
                    <div data-src="resources/imgs/slider/2.jpg"></div>
                    <div data-src="resources/imgs/slider/3.jpg"></div>
                </div>
                <!-- #camera_wrap_1 -->
                <div class="clear"></div>
            </div>
            <!--//slider-->

            <!--Latest News & Events-->
            <div class="wrap block carousel_block">
                <div class="container">
                    <h2 class="upper" style="color: crimson">Latest News & Events</h2>
                    <div class="row">
                        <div class="span12">
                            <ul id="mycarousel2" class="jcarousel-skin-tango">
                                <li>
                                    <div class="post_carousel">
                                        <img src="resources/imgs/1.jpg" />
                                        <div class="title_t">
                                            <h4 style="color: crimson">Egypt Big Data Hackathon 4th Round</h4>
                                        </div>

                                        Information Technology Institute (ITI) is pleased to announce 
                                    its 4th round of Egypt Annual Big Data Hackathon, happening 
                                    the 9-11th February, 2017 at the ITI Premises – Smart Village. 
                                    This year the event is held in partnership with TERADATA.
                                    Pursuing the successful journey ITI started in 2014 by organizing
                                    series of Big Data Hackathons in partnership with different
                                    leading technology vendors, national institutions and private
                                    sector businesses to develop new ideas & insights to solve 
                                    pressing challenges in the society, major business problems or
                                    propose new projects’ ideas bringing together
                                    the big data tools & innovation.
                                    </div>
                                </li>
                                <li>
                                    <div class="post_carousel">
                                        <img src="resources/imgs/2.jpg" />
                                        <div class="title_t">
                                            <h4 style="color: crimson">The Egyptian Djiboutian Capacity Acceleration</h4>
                                        </div>

                                        The Information Technology Institute has completed another round of 
                                   capacity building within the Egyptian Djiboutian Capacity Acceleration
                                   Program (EDCA) for 9 students. The most recent group of students underwent 
                                   an intensive Applications Development training program in the Institute’s main 
                                   headquarters in Smart Village. Training was held from 25th of September
                                   to the 14th of December 2016.
                                     
                                    </div>
                                </li>
                                <li>
                                    <div class="post_carousel">
                                        <img src="resources/imgs/3.jpg" />
                                        <div class="title_t">
                                            <h4 style="color: crimson">Global Game Jam</h4>
                                        </div>

                                        The International Conference on Game Jams, Hackathons and Game Creation Events
                                  is proud to announce our afternoon panel. Global Game Jam co-founder Susan 
                                  Gold will be moderating an exciting panel with discussion on the topic
                                  Diversity and Balance in Hackathons and Game Jams.
                                      
                                    </div>
                                </li>
                                <li>
                                    <div class="post_carousel">
                                        <img src="resources/imgs/4.jpg" />
                                        <div class="title_t">
                                            <h4 style="color: crimson">Youth Skills Development Day</h4>
                                        </div>

                                        In 2016, World Youth Skills Day built on the success of 2015, with higher 
                                    levels of engagement with Members, partners, and supporters. The WorldSkills 
                                    Campaign #SkillsRuleTheWorld was used in a photo campaign and various
                                    WorldSkills activities, but was also used by other organizations, including 
                                    to promote the day.
                                   
                                    
                                   
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrap block">
                <div class="container welcome_block">
                    <div class="welcome_line welcome_t"></div>
                    <h1 style="color: crimson">Life At ITI</h1>
                    In an orchestrated ensemble of human capital development, we enable, empower and elevate P-E-O-P-L-E to strive excellence and lead the change
                <div class="welcome_line welcome_b"></div>
                </div>
            </div>
            <img style="width: 75%; padding-left: 188px" src="resources/imgs/img.png" />
            <!--//Welcome-->

            <!--featured works-->
            <div class="wrap block carousel_block">
            </div>
            <!--planning-->
            <div class="wrap planning">
                <div class="container">
                    <div class="row">
                        <div class="span3">

                            <span class="img_icon icon1">
                                <img src="resources/imgs/icon1.PNG" /></span>
                            <h3 style="color: crimson">10000+</h3>
                            <h5>IT Professionals
                            </h5>
                        </div>
                        <div class="span3">



                            <span class="img_icon icon2">
                                <img src="resources/imgs/icon2.PNG" /></span>
                            <h3 style="color: crimson">280+</h3>
                            <h5>Companies
                            </h5>
                        </div>


                        <div class="span3">

                            <span class="img_icon icon3">
                                <img src="resources/imgs/icon3.PNG" /></span>
                            <h3 style="color: crimson">60+</h3>
                            <h5>IT Job Profiles
                            </h5>
                        </div>
                        <div class="span3">


                            <span class="img_icon icon4">
                                <img src="resources/imgs/icon4.PNG" /></span>
                            <h3 style="color: crimson">28+</h3>
                            <h5>IT Specializations
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="resources/js/jquery.mobile.customized.min.js"></script>
    <script type="text/javascript" src="resources/js/camera.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script src="resources/js/superfish.js"></script>
    <script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="resources/js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="resources/js/jquery.tweet.js"></script>
    <script type="text/javascript" src="resources/js/myscript.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Slider
            $('#camera_wrap_1').camera();

            //Featured works & latest posts
            $('#mycarousel, #mycarousel2, #newscarousel').jcarousel();
        });
    </script>
</asp:Content>
