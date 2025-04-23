const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/assets/stylesheets/**/*.css',
    './config/initializers/**/*.rb',
    './app/assets/builds/**/*.css',
    './app/assets/builds/**/*.js',
    './public/*.html',
    './app/**/*.{erb,haml,html,slim,rb,js}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      animation: {
        'gradient': 'gradient 15s ease infinite',
      },
      keyframes: {
        gradient: {
          '0%, 100%': {
            'background-size': '200% 200%',
            'background-position': 'left center'
          },
          '50%': {
            'background-size': '200% 200%',
            'background-position': 'right center'
          },
        },
      },
      colors: {
        primary: {
          DEFAULT: '#4F46E5',
          50: '#EEEEFC',
          100: '#E0E0FA',
          200: '#C4C3F7',
          300: '#A7A5F3',
          400: '#8B88F0',
          500: '#6E6AEC',
          600: '#4F46E5',
          700: '#3F38B8',
          800: '#2F2A8A',
          900: '#1F1C5C',
        },
        secondary: {
          DEFAULT: '#10B981',
          50: '#ECFDF5',
          100: '#D1FAE5',
          200: '#A7F3D0',
          300: '#6EE7B7',
          400: '#34D399',
          500: '#10B981',
          600: '#059669',
          700: '#047857',
          800: '#065F46',
          900: '#064E3B',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
} 