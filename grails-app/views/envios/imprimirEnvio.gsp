<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>template seldata</title>
    <style>
    .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    .invoice-box table td {
        vertical-align: top;
    }
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 45px;
        color: #333;
    }
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    .invoice-box table tr.heading td {
        background: #4B626D;
        border-bottom: 1px solid #ddd;
        text-align: center;
        min-width: 100px;
        color: white;
    }
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
        text-align: center;
    }
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    .rtl table {
        text-align: right;
    }
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>
</head>
<body>
<div class="invoice-box">
    <table>
        <tr class="top">
            <td colspan="2">
                <table>
                    <tr>
                        <td class="title">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr class="information">
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            <b>Data Encomenda:</b> Fecha<br>
                            <b>Nome:</b>Nombre<br>
                            <b>Morada:</b> Igreja Velha - Santa Comba<br>
                            <b>Concelho:</b> Ponte de Lima<br>
                            <b>Codigo Postal:</b> 4990<br>
                            <b>Codigo da Empresa:</b> 305160<br>
                            <b>Codigo de Distribuidor:</b>00000<br>
                            Da visita ao/a V. Cunha - Ponte de Lima - JF no dia 2018-02-27 resulta o seguinte:
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <p> <b> Encomendas Grosso - Queijo e Manteiga </b> </p>
    <table>
        <tr class="heading">
            <td>
                Marca
            </td>
            <td>
                Produto
            </td>
            <td>
                ID GS1
            </td>
            <td>
                Encomenda
            </td>
            <td>
                Data-Entrega
            </td>
            <td>
                Oferta
            </td>
            <td>
                Observações
            </td>
        </tr>
        <tr class="item">
            <td>
                Limiano
            </td>
            <td>
                Limiano Bola
            </td>
            <td>
                2902310000009
            </td>
            <td>
                40
            </td>
            <td>
                05-03-2018
            </td>
            <td>
                3
            </td>
            <td>
                1 cx em linha a parte
            </td>
        </tr>
    </table>
</div>
</body>
</html>

%{--
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Js-To-PDF</title>

    <style>
    body {
        padding: 40px;
    }
    button {
        padding: 12px 50px;
        border: none;
        background-color: rgb(91,234,208);
        color: #333;
        cursor: pointer;
        display: inline-block;
    }
    input {
        padding: 12px 20px;
    }
    </style>
</head>
<body>


<input type="text" placeholder="name your price" />

<hr />

<button>receipt</button>


<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"
        integrity="sha256-vIL0pZJsOKSz76KKVCyLxzkOT00vXs+Qz4fYRVMoDhw="
        crossorigin="anonymous">
</script>

<script>
    // init the jsPDF library
    const pdf = new jsPDF();
    // select the button
    let button = document.querySelector('button');
    // select the input
    let input = document.querySelector('input');
    // add 'click' event listener for the button
    button.addEventListener('click', printPDF)
    // actual PDF options
    function printPDF() {
        // @param 1 - Coordinate (in units declared at inception of PDF document) against left edge of the page
        // @param 2 - Coordinate (in units declared at inception of PDF document) against upper edge of the page
        // @param 3 - String or array of strings to be added to the page. Each line is shifted one line down per font, spacing settings declared before this call.
        pdf.text(10, 10, `You have to pay $`);
        // save the PDF document (downloadable)
        pdf.save();
    }
</script>

</body>
</html>--}%
