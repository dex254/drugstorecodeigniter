<?php
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        //$image_file = base_url('assets/img/logoug.png');
        $this->Image($image_file,'C', 10, 18, '', 'PNG', false, 'C', false, 300, 'C', false, false, 0, false, false, false);

    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        //$this->writeHTML('Hello'.date('Y-M-d, D h:i:s').' Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), false, true, false, true);
        $this->Cell(0, 10, date('Y-M-d, D h:i:s').' Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
        //$this->Cell(0, 10, 'Requested by:'.$login['fullName'], 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Team');
$pdf->SetTitle('Atlant');
$pdf->SetSubject('Atlant');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);
$pdf->setPrintHeader(false);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->SetFont('times', 'B', 12);

// add a page
$pdf->AddPage('?><?php');

// set some text to print
$html='<h2 align="center" style="margin:0px; line-height:-60px;">COUNTY GOVERNMENT OF UASIN GISHU</h2>
<h5 align="center" style="margin:0px; line-height:-80px;">DEPARTMENT OF HEALTH</h5>
<hr style="margin:0px; line-height:-80px;">
<u><h4 align="center" style="margin:0px; line-height:-40px;">'.$title.'</h4></u>
';

// print a block of text using Write()
$pdf->WriteHTML($html, true, false, true, false,'');

$pdf->SetFont('helvetica', '', 8);

$html='<table border="0.1" cellspacing="" cellpadding="4">
  <tr style="background-color:#abb2b9  ;font-weight:bold;">
  <th width="5%">No</th>
  <th width="25%">Item Description</th>
  <th width="14%">Openning Stock</th>
  <th width="14%">Stock</th>
  <th width="14%">Received Date</th>
  <th width="14%">Expiry</th>
  <th width="14%">Current Stock</th>
  </tr>';
  $x=1;
  foreach ($drugs as $drug){
  $html.='<tr>
    <td width="5%">'.$x.'</td>
    <td width="25%">'.$drug['name'].'</td>
    <td width="14%">'.$drug['opStock'].'</td>
    <td width="14%">'.$drug['stock'].'</td>
    <td width="14%">'.$drug['rDate'].'</td>
    <td width="14%">'.$drug['expiry'].'</td>
    <td width="14%">'.$drug['cStock'].'</td>
  </tr>';
  $x++;
}
  $html.='</table>';
$pdf->WriteHTML($html, true, false, true, false,'');
// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('Stock_list'.date('Y-M-d_h-i-s').'.pdf', 'D');

//============================================================+
// END OF FILE
//============================================================+
