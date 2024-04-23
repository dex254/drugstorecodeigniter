<?php
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = base_url('assets/img/logoug.png');
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
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', true);

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
$pdf->AddPage('P');

// set some text to print
$html='<h1 align="center" style="margin:0px; line-height:-60px;">UASIN GISHU COUNTY</h1>
<h3 align="center" style="margin:0px; line-height:-70px;">DEPARTMENT OF HEALTH</h3>
<h3 align="right" style="margin:0px; line-height:-60px;">UGCMS/'.date('Y/m').'/'.$cartDetailswl['id'].'</h3>
<u><h5 align="center" style="margin:0px; line-height:-120px; text-transform: uppercase;">ISSUED ITEMS TO:'.$cartDetailswl['flName'].'</h5></u>
<hr style="margin:0px; line-height:-40px;">
';

// print a block of text using Write()
$pdf->WriteHTML($html, true, false, true, false,'');

$pdf->SetFont('helvetica', '', 10);

$html='<table border="0.1" cellspacing="" cellpadding="4">
  <tr style="background-color:#abb2b9  ;font-weight:bold;">
    <th width="5%">#</th>
    <th width="40%">Item Description</th>
    <th width="25%">Category</th>
    <th width="15%">Unit of Measure</th>
    <th width="15%">Quantity</th>
  </tr>';
  $x=1;
  foreach ($values as $value){
  $html.='<tr>
    <td width="5%">'.$x.'</td>
    <td width="40%">'.$value['drugName'].'</td>
    <td width="25%">'.$value['ctName'].'</td>
    <td width="15%">'.$value['umName'].'</td>
    <td width="15%">'.$value['quantity'].'</td>
  </tr>';$x++;
}
  $html.='</table>';
  $html.='<img src="'.realpath(APPPATH."C:/xampp/htdocs/drugstore/application/views/drugs/logo.jpg").'"  width="50px" height="50px">';
  $html.='<br><br><br>
  <table>
  <tr><td width="45%"><b>Issueing Officer:</b>  '.$issuing['fname'].' '.$issuing['lname'].' </td><td width="25%"><b>Sign:</b>________________ </td><td width="30%"> <b>Date:</b><i>  '.date('D, d-M-Y').'</i><br> <br> </td></tr>
  <tr><td width="45%"><b>Receiving Officer:</b>  '.$cartDetailswl['requisition'].' </td><td width="25%"><b>Sign:</b>_________________  </td><td width="30%"><b> Date:</b><i>  '.date('D, d-M-Y').'</i><br> <br> </td></tr>
  </table>';
$pdf->WriteHTML($html, true, false, true, false,'');
// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('dispensed_list'.date('Y-M-d_h-i-s').'.pdf', 'D');

//============================================================+
// END OF FILE
//============================================================+
