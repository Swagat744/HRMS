import {
    createContext,
    useContext,
    useEffect,
    useMemo,
    useState,
} from "react";

const ThemeContext = createContext();

const STORAGE_KEY = "hrms-theme";

export function ThemeProvider({ children }) {
    const getInitialTheme = () => {
        if (typeof window === "undefined") return "system";

        const savedTheme = localStorage.getItem(STORAGE_KEY);

        if (savedTheme === "light" || savedTheme === "dark" || savedTheme === "system") {
            return savedTheme;
        }

        return "system";
    };

    const [theme, setTheme] = useState(getInitialTheme);

    const getSystemTheme = () => {
        return window.matchMedia("(prefers-color-scheme: dark)").matches
            ? "dark"
            : "light";
    };

    const [resolvedTheme, setResolvedTheme] = useState(getSystemTheme());

    useEffect(() => {
        const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");

        const applyTheme = () => {
            const activeTheme =
                theme === "system"
                    ? mediaQuery.matches
                        ? "dark"
                        : "light"
                    : theme;

            setResolvedTheme(activeTheme);

            document.documentElement.classList.toggle(
                "dark",
                activeTheme === "dark"
            );
        };

        applyTheme();

        const handleChange = () => {
            if (theme === "system") {
                applyTheme();
            }
        };

        if (mediaQuery.addEventListener) {
            mediaQuery.addEventListener("change", handleChange);
        } else {
            mediaQuery.addListener(handleChange);
        }

        return () => {
            if (mediaQuery.removeEventListener) {
                mediaQuery.removeEventListener("change", handleChange);
            } else {
                mediaQuery.removeListener(handleChange);
            }
        };
    }, [theme]);

    useEffect(() => {
        localStorage.setItem(STORAGE_KEY, theme);
    }, [theme]);

    const value = useMemo(
        () => ({
            theme,
            resolvedTheme,
            setTheme,
            isDark: resolvedTheme === "dark",
        }),
        [theme, resolvedTheme]
    );

    return (
        <ThemeContext.Provider value={value}>
            {children}
        </ThemeContext.Provider>
    );
}

export function useTheme() {
    const context = useContext(ThemeContext);

    if (!context) {
        throw new Error("useTheme must be used inside ThemeProvider");
    }

    return context;
}