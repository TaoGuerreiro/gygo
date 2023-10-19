const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    "./app/components/**/*.{erb,haml,html,slim,rb,js,tailwind.css,css}",
    './config/initializers/simple_form.rb',
  ],
  theme: {
    extend: {
      borderRadius: {
        '4xl': '2rem',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: colors.green[500],
        secondary: colors.green[100],
        content: colors.gray[500],
      },
      keyframes: {
        'fade-out': {
          '0%, 70%': { opacity: 1 },
          '100%': { opacity: 0 }
        }
      },
      animation: {
        'fade-out': 'fade-out 3s linear 1'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
