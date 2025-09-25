const h2 = document.querySelector('h2')
function ne_splitter() {
    if (!h2.innerHTML.includes('ne<br>') && window.innerWidth <= 1049 && window.innerWidth >= 750) h2.innerHTML = h2.innerHTML.replace('ne', 'ne<br>');
    else if (h2.innerHTML.includes('ne<br>') && window.innerWidth > 1049 || window.innerWidth < 750) h2.innerHTML = h2.innerHTML.replace('ne<br>', 'ne');
}
window.addEventListener('load', ne_splitter);
window.addEventListener('resize', ne_splitter);

//window//window//window//window//window//window//window//window//window//window

const wrap  = document.querySelector('.vr-carousel-wrap')
const track = document.querySelector('.vr-carousel-track')

/* 초기 가운데 정렬 */
track.style.left = wrap.clientWidth / 2 - track.scrollWidth / 2 + 'px'

let pressed = false, startX = 0, startLeft = 0

// 브라우저 기본 드래그 방지
wrap.addEventListener('dragstart', e => e.preventDefault())

wrap.addEventListener('mousedown', e => {
    wrap.style.cursor = 'grabbing'
    pressed = true
    startX = e.clientX
    startLeft = parseFloat(track.style.left) || 0
})

wrap.addEventListener('mousemove', e => {
    if (!pressed) return

    const diffX = e.clientX - startX
    /* 보이는 너비 - 전체 너비 */
    const min = wrap.clientWidth - track.scrollWidth
    const max = track.scrollWidth - wrap.clientwidth
    let left = startLeft + diffX

    if (left > 0) {
        left = 0
    } else if (left < min) {
        left = min
    }
    
  track.style.left = left + 'px'
  e.preventDefault()
})

wrap.addEventListener('mouseup', () => {
    wrap.style.cursor = 'grab'
    pressed = false
})
