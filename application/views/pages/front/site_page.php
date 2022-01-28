<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- MAIN CONTENT-->
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="overview-wrap">
                        <!-- <h2 class="title-1"> One Stop Service Media Group News Sekred </h2> -->
                    </div>
                </div>
            </div>
            <div class="row m-t-25">
                <div class="col-sm-12 col-lg-12">
                    <div class="overview-item-news overview-item--c1-news">
                        <div class="overview__inner" id="information_container">
                            <?php 
                            if ( isset($info_redaksi) and $info_redaksi != 0 ) {
                                foreach ($info_redaksi as $info) {
                                 ?>
                                 <div class="overview-box clearfix">
                                    <a href="javascript:void(0)" data-id="<?= $info->informasi_id ?>">
                                        <div class="text">
                                            <h4><?= $info->informasi_text ?></h4>
                                        </div>
                                    </a>
                                </div>
                                <?php 
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <?php 
            if ( isset($menu) and $menu != 0 ) {
                foreach ($menu as $m) {
                    $url    = '';
                    $target = '';
                    if ( substr($m->nav_ctr, 0, 4) == 'http' ) {
                        $url = $m->nav_ctr;
                        $target = '_blank';
                    }else{
                        $url = base_url().$m->nav_ctr;
                    }
                    ?>
                    <div class="col-md-3">
                        <div class="overview-item overview-item--c1">
                            <a href="<?= $url ?>" target="<?= $target ?>">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="<?= $m->nav_icon ?>" aria-hidden="true"></i>
                                        </div>
                                        <div class="text">
                                            <h2><?= $m->nav_name ?></h2>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <?php 
                }
            }
            ?>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="copyright">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- DETAIL MODAL -->
<div class="modal fade" id="informationModal" tabindex="-1" role="dialog" aria-labelledby="informationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="informasi_text" style="color: black;"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <p id="informasi_content"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<!-- END MAIN CONTENT-->