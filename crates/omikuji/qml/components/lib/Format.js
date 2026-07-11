.pragma library

function formatBytes(b) {
    if (b >= 1024 * 1024 * 1024) return (b / (1024 * 1024 * 1024)).toFixed(2) + " GB"
    if (b >= 1024 * 1024) return (b / (1024 * 1024)).toFixed(1) + " MB"
    if (b >= 1024) return (b / 1024).toFixed(1) + " KB"
    return Math.round(b) + " B"
}

function formatSpeed(b) {
    return formatBytes(b) + "/s"
}

function formatBytesShort(bytes) {
    if (bytes <= 0) return ""
    let gb = bytes / (1024 * 1024 * 1024)
    if (gb >= 1) return gb.toFixed(1) + " GB"
    return (bytes / (1024 * 1024)).toFixed(0) + " MB"
}

function formatEta(secs) {
    if (!isFinite(secs) || secs <= 0) return "?"
    if (secs >= 3600) return Math.floor(secs / 3600) + "h " + Math.floor((secs % 3600) / 60) + "m"
    if (secs >= 60) return Math.floor(secs / 60) + "m " + Math.floor(secs % 60) + "s"
    return Math.floor(secs) + "s"
}
