{include file='tpl/header.tpl'}
<ul class="toc" id="toc">
	<li><a href="#info">Informații generale</a></li>
	<li><a href="#adm">Administrație locală</a></li>
	<li><a href="#uat">Localități</a></li>
	<li><a href="#eco">Economie</a></li>
	<li><a href="#dem">Demografie</a></li>
	<li><a href="#mon">Monumente</a></li>
	<li><a href="#pic">Galerie</a></li>
	<li><a href="/" rel="countymenu">Alte județe</a>
		<div id="hiddenmenu" class="hiddentoc">
			{foreach $county_list as $othercounty}
				<a href="?id={$othercounty.index}">{$othercounty.denloc}</a>
			{/foreach}
		</div>
	</li>
</ul>
<hr />
<table width="100%" cellpadding="0" cellspacing="0">
  <td valign=top width="300px">
    <div class="leftbar">
      {if $mappage}><div class="leftbarmap">><a href="{$mappage}" class="image" title="{$name} - harta"><img alt="{$name} - harta" src="{$mapthumb}" ></a></div>{/if}
      <div class="leftbartitle">Date statistice</div>
        <table cellspacing="0" cellpadding="0" width="100%" id="stats" class="leftbarelem">
         <tr><th>Regiune</th><td>{$region}</td></tr>
         <tr><th>Cod SIRUTA</th><td>{$siruta}</td></tr>
	 <tr><th>Prescurtare</th><td>{$abbr}</td></tr>
         <tr><th>Populație ({$census})</th><td>{$population|commify:0:',':'.'} locuitori</td></tr>
         <tr><th>Suprafață</th><td>{$surface|commify:2:',':'.'} km<sup>2</sup></td></tr>
         <tr><th>Densitate</th><td>{$density|commify:2:',':'.'} loc/km<sup>2</sup></td></tr>
        </table>
      <div class="leftbartitle">Consiliul județean</div>
        <table cellspacing="0" cellpadding="0" width="100%" id="cj" class="leftbarelem">
         <tr><th>Președinte</th><td>{if $cjpresid}<a href="http://agenda.grep.ro/person/{$cjpresid}" title="Date de contact pentru {$cjpres}">{$cjpres}</a>{else}{$cjpres}{/if}</td></tr>
         <tr><th>Adresă</th><td>{$cjaddr}</td></tr>
         <tr><th>Site</th><td><a href="http://{$cjsite}" title="Site-ul Consiliului Județean {$name}">{$cjsite}</a></td></tr>
         <tr><th>Email</th><td><a href="mailto:{$cjemail}" title="Emailul-ul Consiliului Județean {$name}">{$cjemail}</a></td></tr>
         <tr><th>Telefon</th><td>(0040) {$cjtel}</td></tr>
         <tr><th>Fax</th><td>(0040) {$cjfax}</td></tr>
        </table>
       <div class="leftbartitle">Prefectura</div>
        <table cellspacing="0" cellpadding="0" width="100%" id="prefect" class="leftbarelem">
         <tr><th>Prefect</th><td>{if $prpresid}<a href="http://agenda.grep.ro/person/{$prpresid}" title="Date de contact pentru {$prpres}">{$prpres}</a>{else}{$prpres}{/if}</td></tr>
         <tr><th>Adresă</th><td>{$praddr}</td></tr>
         <tr><th>Site</th><td><a href="http://{$prsite}" title="Site-ul Consiliului Județean {$name}">{$prsite}</a></td></tr>
         <tr><th>Email</th><td><a href="mailto:{$premail}" title="Emailul-ul Consiliului Județean {$name}">{$premail}</a></td></tr>
         <tr><th>Telefon</th><td>(0040) {$prtel}</td></tr>
         <tr><th>Fax</th><td>(0040) {$prfax}</td></tr>
        </table>
       <div class="leftbartitle">Alte informații</div>
         <ul id="otherlinks">
           <li><a href="https://ro.wikipedia.org/wiki/{$name}" title="Articolul Wikipedia despre {$name}">Articol Wikipedia</a></li>
           <li><a href="https://www.google.ro/search?hl=ro&q={$name}&meta=lr%3Dlang_ro" title="Căutare google după {$name}">Caută pe Google</a></li>
           <li><a href="http://www.facebook.com/share.php?u={$name}+http://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" title="Distribuie pe Facebook">Distribuie pe Facebook</a></li>
           <li><a href="http://twitter.com/home?status={$name}+http://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" title="Tweet">Distribuie pe Tweeter</a></li>
         </ul>
    </div>
  </td>
  <td valign=top>
    <div class="mainsection">
		<a name="info" />
		<div class="maintitle">Informații generale<a href="#top" class="toplink small">[sus]</a></div>
		<p>{$name} este un județ al României aflat în regiunea {$region}.</p>
    </div>
    <div class="mainsection">
		<a name="adm" />
		<div class="maintitle">Administrație locală<a href="#top" class="toplink small">[sus]</a></div>
		<p>
		{if $prpres || $prvice}
			{if $prpres}Prefectul județului {$shortname} este <i>{$prpres}</i>, numit de guvern în anul {$pryear}. {/if}
			{if $prvice}{if $pryear == $prviceyear}Tot din{else}Din{/if} {$prviceyear}, viceprefectul județului este <i>{$prvice}</i>. {/if}
		{else}
		Nu dispunem deocamdată de informatii despre prefectul și subprefectul judetului {$shortname}. Dacă aveti aceste date, vă rugăm să ne contactati.
		{/if}
		</p>
		<p>Consiliul județean rezultat în urma alegerilor din {$cjpresyear} are următoarea componență:</p>
		<ul class="cjcouncil">
			<li><b>Președinte:</b> {if $cjpresid}<a href="http://agenda.grep.ro/person/{$cjpresid}" title="Date de contact pentru {$cjpres}">{$cjpres}</a>{else}{$cjpres}{/if} {if $cjpresparty}({$cjpresparty}){/if}</li><!--TODO: partid-->
			<li><b>Vicepreședinți:</b>
				{if $cjvice}<ul> {foreach $cjvice as $vice}<li>{if $vice.id}<a href="http://agenda.grep.ro/person/{$vice.id}" title="Date de contact pentru {$vice.name}">{$vice.name}</a>{else}{$vice.name}{/if} {if $vice.party}({$vice.party}){/if}</li>{/foreach}</ul>
				{else} Nu dispunem deocamdată de numele vicepreședinților CJ {$shortname}. Dacă dețineți aceste date, vă rugăm să ne contactați.
				{/if}
			</li>
			<li><b>Consilieri:</b> {if $cjcouncil}<ul>{foreach $cjcouncil as $member}<li>{if $member.id}<a href="http://agenda.grep.ro/person/{$member.id}" title="Date de contact pentru {$member.name}">{$member.name}</a>{else}{$member.name}{/if} {if $member.party}({$member.party}){/if}</li>{/foreach}</ul>
						{else} Nu dispunem deocamdată de componența consiliului județean {$shortname}. Dacă dețineți aceste date, vă rugăm să ne contactați.
						{/if}</li>
		</ul>
    </div>
    <div class="mainsection">
		<a name="uat" />
		<div class="maintitle">Localități<a href="#top" class="toplink small">[sus]</a></div>
		<p>Unitățile administrativ-teritoriale ale județului {$shortname} sunt:</p>
		<ul style="-webkit-column-count: 3; -moz-column-count: 3; -o-column-count: 3; column-count: 3;">
		{foreach $uat as $village}
				<li><a href="village.php?siruta={$village._siruta}">{$village.denloc|lower|capitalize}</a></li>
		{/foreach}
		</ul>
    </div>
    <div class="mainsection">
		<a name="eco" />
		<div class="maintitle">Economie<a href="#top" class="toplink small">[sus]</a></div>
		<p>Nu avem încă informații legate de economia acestui județ.</p>
    </div>
    <div class="mainsection">
		<a name="dem" />
		<div class="maintitle">Demografie<a href="#top" class="toplink small">[sus]</a></div>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
		  {literal}google.load("visualization", "1", {packages:["corechart"]});
		  google.setOnLoadCallback(drawChart);
		  function drawChart() {
			var data = google.visualization.arrayToDataTable([
			  ['An', 'Locuitori'],{/literal}
			{foreach $demography as $oldcensus}
				['{$oldcensus.an}', {$oldcensus.populatie}],
			{/foreach}
		{literal}]);

			var options = {
			  title: 'Evoluție demografică',
			  hAxis: {title: 'An'},
			  vAxis: {baseline: 0}
			};

			var chart = new google.visualization.ColumnChart(document.getElementById('demografie'));
			chart.draw(data, options);
		  }{/literal}
		</script>
		<div id="demografie" style="width: 50%; height: 300px"></div>
    </div>
    <div class="mainsection">
		<a name="mon" />
		<div class="maintitle">Monumente<a href="#top" class="toplink small">[sus]</a></div>
		<p>Mai jos aveți 10 monumente aleatorii din {$name|lcfirst}. Imaginile monumentelor provin de la concursul foto <a href="http://wikilovesmonuments.ro">WikiLovesMonuments România</a></p>
		<p><em>Lista completă a monumentelor istorice din {$name|lcfirst} este 
		<a href="https://ro.wikipedia.org/wiki/Lista monumentelor istorice din {$name|lcfirst}" title="Lista monumentelor istorice din {$name|lcfirst}">disponibilă la Wikipedia.</a></em></p>
		<table style="width: 100%; font-size: 0.8em;">
		<tr><th>Cod</th><th>Denumire</th><th>Arhitect</th><th>Poză</th>
		{foreach $monuments as $monument}
		<tr>
			<td>{$monument.cod}</td>
			<td>{$monument.denumire}</td>
			<td>{if $monument.arhitect}{$monument.arhitect}{else}N/A{/if}</td>
			<td style="text-align: center;"><img src="{$monument.thumburl}" width="{if ($monument.thumbh < $monument.thumbw)}60px{else}40px{/if}" height="{if ($monument.thumbh > $monument.thumbw)}60px{else}40px{/if}"/></a></td>
		</tr>
		{/foreach}
		</table>
    </div>
    <div class="mainsection">
		<a name="pic" />
		<div class="maintitle">Galerie<a href="#top" class="toplink small">[sus]</a></div>
		{include file='tpl/pic.tpl'}
    </div>
  </td>
</table>
<script type="text/javascript">
//SYNTAX: tabdropdown.init("menu_id", [integer OR "auto"])
tabdropdown.init("toc", 0)
</script>
{include file='tpl/footer.tpl'}
