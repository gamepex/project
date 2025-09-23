const wrap  = document.querySelector('.vr-carousel-wrap')
const track = document.querySelector('.vr-carousel-track')

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
    const dx = e.clientX - startX
    const min = wrap.clientWidth - track.scrollWidth
    let left = startLeft + dx

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
