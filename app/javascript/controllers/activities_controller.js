import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="activities"
export default class extends Controller {
  // Define targets for HTML elements where charts will be rendered
  static targets = ["nap", "food", "bowel", "mood"]
  // Define values that will be passed from the HTML to the controller
  // These hold the data for the charts (naps, foods, bowels, moods, and corresponding dates)
  static values = {
    naps: Array,
    foods: Array,
    bowels: Array,
    moods: Array,
    dates: Array,
  }
  // Called when the controller is connected to the DOM
  connect() {
     // Create a line chart for nap times
    new Chart(this.napTarget, {
      type: 'line',  // Line chart to visualize nap durations
      data: {
        labels: this.datesValue,   // X-axis labels (dates)
        datasets: [{
          label: 'nap time (minutes)',   // Label for the dataset
          data: this.napsValue,   // Y-axis data (nap durations)
          borderWidth: 3,     // Line thickness
          borderColor: 'black',
          backgroundColor: '#FBCA1F',
          color: 'black',
        }]
      },
      options: {
        responsive: true,   // Make the chart responsive to container size
        maintainAspectRatio: false,   // Allow flexible aspect ratio for better layout
        plugins: {
          legend: {
            display: false      // Hide the chart legend
          },
          tooltips: {
            enabled: false    // Disable tooltips (popups when hovering over data points)
          },
        },
      },
      })
      
      // Create a bar chart for bowel movement data
      new Chart(this.bowelTarget, {
        type: 'bar',    // Bar chart to visualize bowel movement data
        data: {
          labels: this.datesValue,    // X-axis labels (dates)
          datasets: [{
            label: 'bowel',   // Label for the dataset
            data: this.bowelsValue,  //Y-axis data (bowel movements)
            borderWidth: 3,
            borderColor: 'black',
            backgroundColor: '#FBCA1F',
            color: 'black',
          }]
        },
        options: {
          responsive: true,   //Make the chart responsive to container size
          maintainAspectRatio: false,   // Allow flexible aspect ratio for better layaout
          plugins: {
            legend: {
               display: false,    //Hide the chart legend
            }
          },
          scales: {
            y: {
                ticks: {
                    stepSize: 1   // Set the step size for  Y-axis thickness
                }
            }
          }
       }
    });
  }
}
