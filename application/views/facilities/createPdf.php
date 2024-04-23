<?php
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = base_url('assets/img/tibralink.png');
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
$pdf->SetAuthor('Brian Chemwotie');
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
$pdf->AddPage('L');

// set some text to print
$html='<h2 align="center" style="margin:0px; line-height:-60px;">UASIN GISHU COUNTY</h2>
<h5 align="center" style="margin:0px; line-height:-80px;">DEPARTMENT OF HEALTH</h5>
<hr style="margin:0px; line-height:-80px;">
<u><h4 align="center" style="margin:0px; line-height:-40px;">LIST OF FACILITIES</h4></u>
';

// print a block of text using Write()
$pdf->WriteHTML($html, true, false, true, false,'');

$pdf->SetFont('helvetica', '', 8);

$html='<table border="0.1" cellspacing="" cellpadding="4">
  <tr style="background-color:#abb2b9  ;font-weight:bold;">
    <th>Facility Code</th>
    <th>Facility Name</th>
  </tr>';
  foreach ($facilities as $facility){
  $html.='<tr>
    <td>'.$facility['code'].'</td>
    <td>'.$facility['name'].'</td>
  </tr>';
}
  $html.='</table>';
$pdf->WriteHTML($html, true, false, true, false,'');
// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('facilities_list'.date('Y-M-d_h-i-s').'.pdf', 'D');

//============================================================+
// END OF FILE
//============================================================+
