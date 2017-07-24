import {
  Component,
  TemplateRef,
  ViewChild,
  ElementRef } from '@angular/core';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  username: String;
  password: String;
  authorized: boolean = true;
  routeTo: String;
  selectedValue: String;
  subscriptionLimited: boolean;
  showSpinner: boolean = true;

  public type = "line";
  public data = {
    labels: ['Quick Win','Important','Medium','Small'],
    datasets: [
      {
        label: 'Spend Amount',
        data: [16672480, 4873483, 20967342, 2127782],
        // type: 'line'
      },
      {
        label: 'PO Count',
        data: [4075, 3324, 7931, 6783],
        // type: 'line'
      }
    ]
  }

  public options = {
    responsive: true,
    maintainAscpectRatio: false
  }

  @ViewChild('mixedChart') mixedChart: ElementRef;

  public radarChartLabels:string[] = ['Qucik Win', 'Important', 'Medium', 'Small'];

  public barChartLabels:string[] = ['Supplier Compliance Savings ($1.23M)', 'Invoice Error Reductions Savings ($2.3M)', 'PO Requisition Transmission Savings ($0.12M)', 'Invoice Receipt Processing Savings($.04M)'];
  public barChartType:string = 'horizontalBar';
  public barChartLegend:boolean = false;

  public barChartData:any[] = [
    {data: [1232353,2325346,124234,45346], label: 'Amount'}
  ];

  public mixedChartData:any = [
    {
      data: {
        datasets: [{
          label: 'Spend Amount',
          data: [16672480, 4873483, 20967342, 2127782]
        }, {
          label: 'PO Count',
          data: [4075, 3324, 7931, 6783],
          type: 'bar'
        }, {
          label: 'Invoice Count',
          data: [4015, 3342, 7950, 6770],
          type: 'line'
        }]
      }
    }
  ]

  public radarChartData1:any = [
    {data: [16672480, 4873483, 20967342, 2127782], label: 'Spend Amount'}
  ];

    public radarChartData2:any = [
    {data: [4075, 3324, 7931, 6783], label: 'PO Count', type:'line', fill:'origin'}
  ];

    public radarChartData3:any = [
    {data: [4015, 3342, 7950, 6770], label: 'Invoice Count', type:'bar'}
  ];
  public radarChartType:string = 'line';
  public horizontalBarChartType:string = 'horizontalBar';
  login() {

  }

  onSelectSubscription(val: boolean) {
    this.subscriptionLimited = val;
    console.log(this.subscriptionLimited);
  }

  displaySpinner(val: boolean) {
    this.showSpinner = true;
    this.authorized = true;
  }
}
