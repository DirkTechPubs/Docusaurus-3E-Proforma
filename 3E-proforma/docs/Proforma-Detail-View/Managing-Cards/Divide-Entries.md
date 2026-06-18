### **Divide Entries**

#### About Divide Cards

After time and cost entries have been included in a proforma, the worked and billed hours on the original entry can be divided. The purpose of dividing time and/or cost entries is to exclude them from the proforma, or to partially purge a record.

Calculated charge entries, i.e., taxes, interest, BOA, flat fees, markups, etc., cannot be divided; however, charge entries entered directly, i.e., as anticipated time/costs, etc, can be divided in the same manner as time and cost entries. One or multiple entries can be created for the divided amounts. The original entry is changed to the new reduced value. In addition, the divided entries can be optionally transferred to another proforma.

 

#### Divide Cards

Do the following to flag a card to be divided. Divided cards can be moved to another proforma, kept on the current proforma, or purged.

**Note:** Whether the 3E Proforma action of Divide is automatically loaded into 3E in Proforma Edit depends on the “Commit_cardactions” setting in core 3E. If the setting is set to **False**, a biller will be required to review and finalize the Divide action in Proforma Edit by clicking on ProcTransfer or ProcExlude action. If the setting is set to **True**, the Divide action is performed automatically in 3E Proforma on the Save & recalc/Save & close/Submit actions.

1.  Locate the proforma containing funds on the Proforma list.

2.  Click the proforma number to access the Proforma Details view.

3.  Click the appropriate tab (i.e., Fees, Costs, or Charge).

4.  Click the card-level **Action** menu for a listed card and select **Divide**.

**Note**: The **Divide** option is not available on the card list batch-Action menu.

5.  Select settings to apply when the card is divided. See [Divide Card Form and Field Definitions](#divide-card-form-and-field-definitions) for details.

**Note**: Options available on the Divide form will vary by card type.

6.  Click **Divide**.

7.  Click **Save & Close**.

 

#### Divide Card Form and Field Definitions

This form is used to generate divided cards (e.g., Time or Costs) that can be moved to another proforma, kept on the current proforma, or purged.

[<u>Time Divide Form and Field Definitions</u>](#time-divide-form-and-field-definitions)

[<u>Cost Divide Form and Field Definitions</u>](#cost-divide-form-and-field-definitions)

[<u>Charge Divide Form and Field Definitions</u>](#charge-divide-form-and-field-definitions)

 

![](/img/media/image96.png)
##### *Time Divide Form and Field Definitions*

Fields preceded with an asterisk in the table below are required.

<table style="width: 96%">
<colgroup>
<col style="width: 30%" />
<col style="width: 65%" />
</colgroup>
<thead><tr><th><strong>Field Name</strong></th><th><strong>Description</strong></th></tr></thead>
<tbody><tr><td><strong>Change Reason</strong></td><td>Type or query to select the reason for dividing this entry.</td></tr><tr><td><strong>Authorized by</strong></td><td>Type or query to select the authorizing party for the dividing of this entry.</td></tr><tr><td><strong>Adjust rates</strong></td><td>If the check box is selected, then the associated work and/or bill rate is adjusted in the Time <a href="#-883071847"><u>Divide List</u></a>.</td></tr><tr><td><strong>Purge</strong></td><td>Select the check box to divide the entry, and then purge the remaining value.</td></tr><tr><td><strong>Purge type</strong></td><td>From the drop-down list, select the purge type when purging the remaining value.</td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays. The timekeeper display name is in the next field.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry displays for informational purposes only.</td></tr><tr><td><strong>Index</strong></td><td>The card index for this entry displays for informational purposes only.</td></tr><tr><td><strong>Time Type</strong></td><td>Displays the descriptive code used for this entry (e.g., Fees, hourly, etc.).</td></tr><tr><td><strong>Hours/Units</strong></td><td>The actual worked values (hours/Units) for the card entry display for informational purposes only.</td></tr><tr><td><strong>Rate</strong></td><td>The actual worked rate value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Amount</strong></td><td>The actual worked amount value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative from the original time entry is displayed; however, it can be edited.</td></tr><tr><td colspan="2"><strong>Time Divide List</strong></td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays. The timekeeper display name is in the next field.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry</td></tr><tr><td><strong>Time Type</strong></td><td>Displays the descriptive code used for this entry (e.g., Fees).</td></tr><tr><td><strong>Include on current proforma</strong></td><td>Select this check box to leave the divided entries on the current proforma after Process Transfers is performed. Leave this check box clear to transfer the entries to another proforma.</td></tr><tr><td><strong>Target proforma</strong></td><td>Type or query to select a destination proforma if the divided amounts are to be transferred to a different matter. If no destination proforma is indicated, the new entry remains on the matter.</td></tr><tr><td><strong>*Work Hours/Bill Hours</strong></td><td><p>Type the worked hours to be subtracted from the existing entry and added to the new entry. This is the number of hours that will be excluded from the proforma. When hours are entered, the amount adjusts.</p><p>The bill hours defaults to the value entered in the worked hours. If you want to type an amount other than the default, type over the existing value with the new value.</p><p><strong>Note</strong> : Both the Work and Bill Hours cannot exceed the original work and bill Hours on the proforma. Negative amounts and hours are not allowed.</p></td></tr><tr><td><strong>Work Rate/Bill Rate</strong></td><td>This read-only field displays the fee rate per hour for the destination matter that displays in the child form. If a different destination is entered than the original matter, there could be a different rate. If the <strong>Adjust Rate</strong> check box is selected, then the divided timecard reflects the destinations matter's rate. To have the divided timecard reflect the original matter, de-select the <strong>Adjust</strong> Rate check and click <strong>Recalc Rate</strong> .</td></tr><tr><td><strong>*Work Amount/Bill Amount</strong></td><td><p>This is the fee amount that will be excluded from the proforma. When the hours and rate are changed, the amount also changes. The hours must be entered first.</p><p>The bill amount defaults to the value entered in the work hours. If you want to type an amount other than the default, type over the existing value with the new value.</p><p><strong>Note</strong>: Both the Work Amount and Bill Amount cannot exceed the original work and bill amounts on the proforma.</p></td></tr><tr><td><strong>Matter</strong></td><td>The matter for this proforma displays. To divide the entry to a different matter, type or <u>query to select</u> the destination matter.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative on the original time card is duplicated on the new entry; however, you can type a new narrative.</td></tr><tr><td><strong>Comments</strong></td><td>Type text to add a comment on this card entry.</td></tr><tr><td><strong>Action Menu</strong></td><td><p>The following options are available on this Action menu:</p><ul><li><p><strong>No charge</strong> - Select to set the card's status to BNC (Bill no charge) or NC (no charge).</p></li><li><p><strong>Non-billable</strong> - Select to flag the card as non-billable. This action reduces the hours and amount to zero. In 3E, the card will be marked for Excluded and Non Billable.</p></li><li><p><strong>Recalc rate</strong> - Select to reset the time rate to the rate associated with the time entry's matter and recalculate the value of the time entry based on the matter’s rate.</p></li></ul></td></tr><tr><td><strong>Add Fee</strong></td><td>Click to add a new card entry.</td></tr></tbody>
</table>

 

##### *Cost Divide Form and Field Definitions*

Fields preceded with an asterisk in the table below are required.

<table style="width: 96%">
<colgroup>
<col style="width: 30%" />
<col style="width: 65%" />
</colgroup>
<thead><tr><th><strong>Field Name</strong></th><th><strong>Description</strong></th></tr></thead>
<tbody><tr><td><strong>Change Reason</strong></td><td>Type or query to select the reason for dividing this entry.</td></tr><tr><td><strong>Authorized by</strong></td><td>Type or query to select the authorizing party for the dividing of this entry.</td></tr><tr><td><strong>Adjust rates</strong></td><td>If the check box is selected, then the associated work and/or bill rate is adjusted in the Time <a href="#-883071847"><u>Divide List</u></a>.</td></tr><tr><td><strong>Purge</strong></td><td>Select the check box to divide the entry, and then purge the remaining value.</td></tr><tr><td><strong>Purge type</strong></td><td>From the drop-down list, select the purge type when purging the remaining value.</td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry displays for informational purposes only.</td></tr><tr><td><strong>Index</strong></td><td>The card index for this entry displays for informational purposes only.</td></tr><tr><td><p><strong>Cost Type</strong></p><p><strong> </strong></p></td><td>Displays the descriptive code used for this entry (e.g., Copies.).</td></tr><tr><td><strong>Units</strong></td><td>The actual worked units value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Rate</strong></td><td>The actual worked rate value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Amount</strong></td><td>The actual worked amount value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative from the original time entry is displayed; however, <a href="../../Getting-Started/Standard-Features-and-Navigation/Card-Narrative-Fields.md#card-narrative-fields"><u>it can be edited</u></a>.</td></tr><tr><td colspan="2"><strong>Costs Divide List</strong></td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays. The timekeeper display name is in the next field.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry</td></tr><tr><td><strong>Cost Type</strong></td><td>Displays the descriptive code used for this entry (e.g., Fees, hourly, etc.).</td></tr><tr><td><strong>Include on current proforma</strong></td><td>Select this check box to leave the divided entries on the current proforma after Process Transfers is performed. Leave this check box clear to transfer the entries to another proforma.</td></tr><tr><td><strong>Target proforma</strong></td><td>Type or query to select a destination proforma if the divided amounts are to be transferred to a different matter. If no destination proforma is indicated, the new entry remains on the matter.</td></tr><tr><td><strong>*Work Quantity/Bill Quantity</strong></td><td><p>Type the quantity to be subtracted from the existing entry and added to the new entry. This is the amount that will be excluded from the proforma. When quantity is entered, the amount adjusts. The rate adjusts to the destination matter's rate if the <strong>Adjust Rate</strong> check box is selected.</p><p>The bill quantity defaults to the value entered in the work quantity. If you want to type an quantity other than the default, type over the existing value with the new value.</p><p><strong>Note</strong>: Both the Work and Bill Quantity cannot exceed the original work and bill Quantity on the proforma. Negative amounts and hours are not allowed.</p></td></tr><tr><td><strong>*Work Amount/Bill Amount</strong></td><td><p>This is the cost amount that will be excluded from the proforma. When the quantity and rate are changed, the amount also changes. The quantity must be entered first.</p><p>The bill amount defaults to the value entered in the work hours. If you want to type an amount other than the default, type over the existing value with the new value.</p><p><strong>Note</strong>: Both the Work Amount and Bill Amount cannot exceed the original work and bill amounts on the proforma.</p></td></tr><tr><td><strong>Matter</strong></td><td>The matter for this proforma displays. To divide the entry to a different matter, type or <u>query to select</u> the destination matter. The matter name and the client name display in the boxes next to this field.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative on the original cost card is duplicated on the new entry; however, you can type a new narrative.</td></tr><tr><td><strong>Comments</strong></td><td>Type text to add a comment on this card entry.</td></tr><tr><td><strong>Action Menu</strong></td><td><p>Options:</p><ul><li><p><strong>No charge</strong> - Select to set the card's status to BNC (Bill no charge) or NC (no charge).</p></li><li><p><strong>Non-billable</strong> - Select to flag the card as non-billable. This action reduces the hours and amount to zero. In 3E, the card will be marked for Excluded and Non Billable.</p></li><li><p><strong>Recalc rate</strong> - Select to reset the cost rate to the rate associated with the cost entry's matter and recalculate the value of the cost entry based on the matter’s rate.</p></li></ul></td></tr><tr><td><strong>Add Cost</strong></td><td>Click to add a new card entry.</td></tr></tbody>
</table>

 

##### *Charge Divide Form and Field Definitions*

The following is the standard Charge Divide form.

Fields preceded with an asterisk in the table below are required.

<table style="width: 96%">
<colgroup>
<col style="width: 30%" />
<col style="width: 65%" />
</colgroup>
<thead><tr><th><strong>Field Name</strong></th><th><strong>Description</strong></th></tr></thead>
<tbody><tr><td><strong>Change Reason</strong></td><td>Type or query to select the reason for dividing this entry.</td></tr><tr><td><strong>Authorized by</strong></td><td>Type or query to select the authorizing party for the dividing of this entry.</td></tr><tr><td><strong>Adjust rates</strong></td><td>If the check box is selected, then the associated work and/or bill rate is adjusted in the Time <a href="#-883071847"><u>Divide List</u></a>.</td></tr><tr><td><strong>Purge</strong></td><td>Select the check box to divide the entry, and then purge the remaining value.</td></tr><tr><td><strong>Purge type</strong></td><td>From the drop-down list, select the purge type when purging the remaining value.</td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays. The timekeeper display name is in the next field.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry displays for informational purposes only.</td></tr><tr><td><strong>Index</strong></td><td>The card index for this entry displays for informational purposes only.</td></tr><tr><td><strong>Charge Type</strong></td><td>Displays the descriptive code used for this entry (e.g., Fees, hourly, etc.).</td></tr><tr><td><strong>Hours/Units</strong></td><td>The actual worked values (hours/Units) for the card entry display for informational purposes only.</td></tr><tr><td><strong>Rate</strong></td><td>The actual worked rate value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Amount</strong></td><td>The actual worked amount value for the card entry display for informational purposes only.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative from the original time entry is displayed; however, it can be edited.</td></tr><tr><td colspan="2"><strong>Charge Divide List</strong></td></tr><tr><td><strong>Timekeeper</strong></td><td>The timekeeper for the matter displays. The timekeeper display name is in the next field.</td></tr><tr><td><strong>Date</strong></td><td>The work date for this entry</td></tr><tr><td><strong>Charge Type</strong></td><td>Displays the descriptive code used for this entry.</td></tr><tr><td><strong>Include on current proforma</strong></td><td>Select this check box to leave the divided entries on the current proforma after Process Transfers is performed. Leave this check box clear to transfer the entries to another proforma.</td></tr><tr><td><strong>Target proforma</strong></td><td>Type or query to select a destination proforma if the divided amounts are to be transferred to a different matter. If no destination proforma is indicated, the new entry remains on the matter.</td></tr><tr><td><strong>*Work Amount/Bill Amount</strong></td><td><p>Type the amount to be subtracted from the existing entry and added to the new entry. This is the amount that will be excluded from the proforma.</p><p>The bill amount defaults to the value entered in the work amount. If you want to type an amount other than the default, type over the existing value with the new value.</p><p><strong>Note</strong> : Both the Work Amount and Bill Amount cannot exceed the original work and bill amounts on the proforma. Negative amounts and hours are not allowed.</p></td></tr><tr><td><strong>Matter</strong></td><td>The matter for this proforma displays. To divide the entry to a different matter, type or <u>query to select</u> the destination matter. The matter name and the client name display in the boxes next to this field.</td></tr><tr><td><strong>Narrative</strong></td><td>The narrative on the original charge card is duplicated on the new entry; however, you can type a new narrative.</td></tr><tr><td><strong>Comments</strong></td><td>Type text to add a comment on this card entry.</td></tr><tr><td><strong>Action Menu</strong></td><td><p>Options:</p><ul><li><p><strong>No charge</strong> - Select to set the card's status to BNC (Bill no charge) or NC (no charge).</p></li><li><p><strong>Non-billable</strong> - Select to flag the card as non-billable. This action reduces the hours and amount to zero. In 3E, the card will be marked for Excluded and Non Billable.</p></li><li><p><strong>Recalc rate</strong> - Select to reset the time rate to the rate associated with the charge entry's matter and recalculate the value of the charge entry based on the matter’s rate.</p></li></ul></td></tr><tr><td><strong>Add Charge</strong></td><td>Click to add a new card entry.</td></tr></tbody>
</table>

 

