import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

// Connects to data-controller="charts"
export default class extends Controller {
  static values = {
    dates: Array,
    visitCounts: Array,
    cumulativeVisits: Array,
    uniqueVisitors: Array,
    deviceData: Object,
    locationData: Object,
    timeData: Object
  }

  connect() {
    console.log("Charts controller connected")
    this.initializeCharts()
  }

  initializeCharts() {
    // Growth chart
    this.initializeGrowthChart()
    
    // Device distribution chart
    this.initializeDeviceChart()
    
    // Location chart
    this.initializeLocationChart()
    
    // Time of day chart
    this.initializeTimeChart()
  }

  initializeGrowthChart() {
    const ctx = document.getElementById('growthChart').getContext('2d')
    
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: this.datesValue,
        datasets: [
          {
            label: 'Daily Visits',
            data: this.visitCountsValue,
            borderColor: '#3498db',
            backgroundColor: 'rgba(52, 152, 219, 0.1)',
            borderWidth: 2,
            fill: true,
            tension: 0.4
          },
          {
            label: 'Cumulative Visits',
            data: this.cumulativeVisitsValue,
            borderColor: '#2ecc71',
            backgroundColor: 'rgba(46, 204, 113, 0.1)',
            borderWidth: 2,
            fill: true,
            tension: 0.4
          },
          {
            label: 'Unique Visitors',
            data: this.uniqueVisitorsValue,
            borderColor: '#e74c3c',
            backgroundColor: 'rgba(231, 76, 60, 0.1)',
            borderWidth: 2,
            fill: true,
            tension: 0.4
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          title: {
            display: true,
            text: 'Visit Growth Over Time'
          },
          tooltip: {
            mode: 'index',
            intersect: false
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Number of Visits'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Date'
            }
          }
        }
      }
    })
  }

  initializeDeviceChart() {
    const ctx = document.getElementById('deviceChart').getContext('2d')
    
    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: Object.keys(this.deviceDataValue),
        datasets: [{
          data: Object.values(this.deviceDataValue),
          backgroundColor: [
            '#3498db', '#2ecc71', '#e74c3c'
          ]
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'right'
          },
          title: {
            display: true,
            text: 'Device Distribution'
          }
        }
      }
    })
  }

  initializeLocationChart() {
    const ctx = document.getElementById('locationChart').getContext('2d')
    
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: Object.keys(this.locationDataValue),
        datasets: [{
          label: 'Visits',
          data: Object.values(this.locationDataValue),
          backgroundColor: '#3498db'
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          },
          title: {
            display: true,
            text: 'Location Distribution'
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Number of Visits'
            }
          }
        }
      }
    })
  }

  initializeTimeChart() {
    const ctx = document.getElementById('timeChart').getContext('2d')
    
    const hours = Array.from({length: 24}, (_, i) => i)
    const visitsByHour = hours.map(hour => this.timeDataValue[hour.toString().padStart(2, '0')] || 0)
    
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: hours.map(h => `${h}:00`),
        datasets: [{
          label: 'Visits',
          data: visitsByHour,
          borderColor: '#9b59b6',
          backgroundColor: 'rgba(155, 89, 182, 0.1)',
          fill: true,
          tension: 0.4
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          },
          title: {
            display: true,
            text: 'Visit Times'
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Number of Visits'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Hour of Day'
            }
          }
        }
      }
    })
  }
} 