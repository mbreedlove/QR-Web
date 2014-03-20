#!/usr/bin/env ruby

require 'sinatra'
require 'rqrcode'

get '/' do
  halt
end

get '/:data' do |d|
  qr = RQRCode::QRCode.new(d)
  out = '<style type="text/css"> table{border-width: 0;border-style: none;border-color: #0000ff;border-collapse: collapse;}td{border-width: 0;border-style: none;border-color: #0000ff;border-collapse: collapse;padding: 0;margin: 0;width: 10px;height: 10px;}td.black{background-color: #000;}td.white{background-color: #fff;}</style><table>'
  qr.modules.each_index do |x|
    out += '<tr>'
    qr.modules.each_index do |y|
        if qr.dark?(x,y)
          out += '<td class="black"/>'
        else
          out += '<td class="white"/>'
        end
    end
    out += '</tr>'
  end
  out += '</table>'
  out
end
