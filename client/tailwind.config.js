/** @type {import('tailwindcss').Config} */
export default {
  darkMode: 'class',

  content: ['./index.html', './src/**/*.{js,jsx}'],

  theme: {
    extend: {
      colors: {
        // =========================
        // Semantic Theme Tokens
        // (Powered by CSS Variables)
        // =========================
        background: 'rgb(var(--background) / <alpha-value>)',
        foreground: 'rgb(var(--foreground) / <alpha-value>)',

        surface: 'rgb(var(--surface) / <alpha-value>)',

        card: 'rgb(var(--card) / <alpha-value>)',
        'card-foreground': 'rgb(var(--card-foreground) / <alpha-value>)',

        border: 'rgb(var(--border) / <alpha-value>)',

        muted: 'rgb(var(--muted) / <alpha-value>)',
        'muted-foreground': 'rgb(var(--muted-foreground) / <alpha-value>)',

        input: 'rgb(var(--input) / <alpha-value>)',

        ring: 'rgb(var(--ring) / <alpha-value>)',

        // =========================
        // Existing Brand Colors
        // =========================

        // Teal — Primary Brand Color
        primary: {
          50: '#EAFAFB',
          100: '#CFF3F5',
          200: '#9FE6EA',
          300: '#6BD3DA',
          400: '#3AB9C4',
          500: '#0EA0AC',
          600: '#018790',
          700: '#016E77',
          800: '#075761',
          900: '#0A424A',
        },

        // Coral — Accent / CTA
        accent: {
          50: '#FFF3EE',
          100: '#FFE1D3',
          200: '#FFC3A9',
          300: '#FFA47C',
          400: '#FB8B63',
          500: '#F77754',
          600: '#E85F3A',
          700: '#C94B29',
          800: '#A53B1F',
          900: '#7C2C16',
        },

        // Deep Navy / Teal
        deep: {
          400: '#136F8F',
          500: '#0A516D',
          600: '#084257',
          700: '#063441',
          800: '#052A34',
          900: '#04212A',
        },

        // Ink Scale
        ink: {
          50: '#F8FAF9',
          100: '#F0F3F2',
          200: '#E1E7E5',
          300: '#C7D1CE',
          400: '#94A19D',
          500: '#647573',
          600: '#47534F',
          700: '#333D3A',
          800: '#202726',
          900: '#171E1D',
        },

        success: {
          50: '#ECFDF5',
          500: '#10B981',
          600: '#059669',
          700: '#047857',
        },

        warning: {
          50: '#FFF3EE',
          500: '#F77754',
          600: '#E85F3A',
          700: '#C94B29',
        },

        danger: {
          50: '#FEF2F2',
          500: '#EF4444',
          600: '#DC2626',
          700: '#B91C1C',
        },

        info: {
          50: '#EAFAFB',
          500: '#136F8F',
          600: '#0A516D',
          700: '#084257',
        },
      },

      borderRadius: {
        xl: '14px',
        '2xl': '20px',
        '3xl': '28px',
      },

      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
      },

      boxShadow: {
        soft: '0 1px 2px rgba(10,66,74,0.04), 0 1px 3px rgba(10,66,74,0.06)',
        card: '0 1px 2px rgba(10,66,74,0.04), 0 4px 20px rgba(10,66,74,0.06)',
        popover: '0 8px 28px rgba(10,66,74,0.14), 0 2px 8px rgba(10,66,74,0.08)',
        glass: '0 8px 32px rgba(10,66,74,0.18), inset 0 1px 0 rgba(255,255,255,0.4)',
        glow: '0 0 0 1px rgba(1,135,144,0.08), 0 8px 24px rgba(1,135,144,0.16)',
      },

      backdropBlur: {
        xs: '2px',
      },

      animation: {
        'fade-in': 'fadeIn 0.25s ease-out',
        'slide-up': 'slideUp 0.3s ease-out',
        float: 'float 8s ease-in-out infinite',
        'float-slow': 'float 12s ease-in-out infinite',
        'float-delayed': 'float 10s ease-in-out infinite 1.5s',
      },

      keyframes: {
        fadeIn: {
          '0%': { opacity: 0 },
          '100%': { opacity: 1 },
        },

        slideUp: {
          '0%': {
            opacity: 0,
            transform: 'translateY(8px)',
          },
          '100%': {
            opacity: 1,
            transform: 'translateY(0)',
          },
        },

        float: {
          '0%, 100%': {
            transform: 'translate(0, 0) scale(1)',
          },
          '50%': {
            transform: 'translate(0, -22px) scale(1.04)',
          },
        },
      },
    },
  },

  plugins: [],
};