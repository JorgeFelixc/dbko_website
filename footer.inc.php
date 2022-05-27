</div>
</div>

<div id="error" onclick="setStyle(this,'display','none')">
<span id="javacheck">This website requires javascript to run correctly.<br/></span><span><?php if (!empty($error)) echo $error;?></span><br/></div>
<script language="javascript" type="text/javascript">
//<![CDATA[
	setStyle('javacheck','display','none');
	<?php if (empty($error)) echo "setStyle('error','display','none');";?>
//]]>
</script>
</div>
<?php 
//Get current time as we did at start
    $mtime = microtime();
    $mtime = explode(" ",$mtime);
    $mtime = $mtime[1] + $mtime[0];
//Store end time in a variable
    $tend = $mtime;
//Calculate the difference
    $totaltime = ($tend - $tstart);
//Output result
    printf ("<!--Page was generated in %f seconds !-->\n", $totaltime); 
?>

<footer>
    <div class="row">
        <img class="img-ball" src="skins/ball.png" />
    <span>
            Dragon ball Server
        </span>
    </div>


    
</footer>
</body>
</html>
