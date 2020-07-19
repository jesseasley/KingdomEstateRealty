    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td width="100px">
                City</td>
            <td width="200px">
                <select id="selCity" style="width:150px">
                    <option value="">Any city</option>
                    <option value="Flower Mound" selected>Flower Mound</option>
                    <option value="Lewisville">Lewisville</option>
                    <option value="Highland Village">Highland Village</option>
                </select>&nbsp;</td>
            <td width="100px">
                Price&nbsp;</td>
            <td width="160px">
                <select id="selPriceMin" style="width:120px">
                    <option value="">No minimum</option>
                    <option value="100000">100,000</option>
                    <option value="150000">150,000</option>
                    <option value="200000">200,000</option>
                    <option value="250000" selected>250,000</option>
                    <option value="300000">300,000</option>
                    <option value="350000">350,000</option>
                    <option value="400000">400,000</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;to
            </td>
            <td width="200px"><nobr>
                <select id="selPriceMax" style="width:120px">
                    <option value="">No maximum</option>
                    <option value="100000">100,000</option>
                    <option value="150000">150,000</option>
                    <option value="200000">200,000</option>
                    <option value="250000">250,000</option>
                    <option value="300000">300,000</option>
                    <option value="350000">350,000</option>
                    <option value="400000" selected>400,000</option>
                </select></nobr>
            </td>
        </tr>
        <tr>
            <td>
                Bedrooms</td>
            <td>
                <select id="selBeds" style="width:150px">
                    <option value="">Any</option>
                    <option value="2">2</option>
                    <option value="3" selected>3</option>
                    <option value="4">4+</option>
                </select></td>
            <td>
                Square feet&nbsp;</td>
            <td>
                <select id="selSqFtMin" style="width:120px">
                    <option value="">No minimum</option>
                    <option value="1000">1000</option>
                    <option value="1500">1500</option>
                    <option value="2000">2000</option>
                    <option value="2500" selected>2500</option>
                    <option value="3000">3000</option>
                    <option value="3500">3500</option>
                    <option value="4000">4000</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;to
            </td>
            <td>
                <select id="selSqFtMax" style="width:120px">
                    <option value="">No maximum</option>
                    <option value="1000">1000</option>
                    <option value="1500">1500</option>
                    <option value="2000">2000</option>
                    <option value="2500">2500</option>
                    <option value="3000">3000</option>
                    <option value="3500">3500</option>
                    <option value="4000" selected>4000</option>
                </select>&nbsp;&nbsp;&nbsp;Square feet
            </td>
        </tr>
        <tr>
            <td>
                Bathrooms</td>
            <td>
                <select id="selBaths" style="width:150px">
                    <option value="">Any</option>
                    <option value="2" selected>2</option>
                    <option value="3">3</option>
                    <option value="4">4+</option>
                </select></td>
            <td>
                Lot size&nbsp;</td>
            <td>
                <select id="selLotMin" style="width:120px">
                    <option value="">No minimum</option>
                    <option value=".25">1/4</option>
                    <option value=".5" selected>1/2</option>
                    <option value=".75">3/4</option>
                    <option value="1">1</option>
                    <option value="1.5">1.5</option>
                    <option value="2">2</option>
                    <option value="2.5">2.5</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;to
            </td>
            <td>
                <select id="selLotMax" style="width:120px">
                    <option value="">No maximum</option>
                    <option value=".25">1/4</option>
                    <option value=".5">1/2</option>
                    <option value=".75">3/4</option>
                    <option value="1">1</option>
                    <option value="1.5">1.5</option>
                    <option value="2">2</option>
                    <option value="2.5">2.5</option>
                </select>&nbsp;&nbsp;&nbsp;Acres
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <br />
                <input type="button" id="btnSearch" onclick="submitListingSearch();" value="Search" />
            </td>
        </tr>
    </table>
