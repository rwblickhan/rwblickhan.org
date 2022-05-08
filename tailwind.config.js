const tailwindcss = require("tailwindcss");

module.exports = {
  content: ["./Output/**/*.html"],
  theme: {
      fontFamily: {
        'sans': ['Vollkorn'],
        'serif': ['Vollkorn'],
      },
      extend: {
        colors: {
          'rwb-blue-light': '#3366cc',
          'rwb-blue-dark': '#2e5cb8',
          'rwb-slate-light': '#ebedef',
        },
      }
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}
